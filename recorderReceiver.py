import os
import time
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError

SCOPES = ['https://www.googleapis.com/auth/drive.file']
CLIENT_SECRET_FILE = '/home/pc70809/workspace/client_secret_739625794359-2dcksrdvl2fvl107ibpbaqp831u8tuqs.apps.googleusercontent.com.json'
APPLICATION_NAME = 'recorder'
TOKEN_FILE = 'token.json'  # 權杖檔案名稱
DOWNLOAD_PATH = '/media/pc70809/4TBVolume/recording_test'  # 下載檔案的路徑
CHECK_INTERVAL = 600  # 10分钟检查一次

def download_file(service, file_id, download_path):
    request = service.files().get_media(fileId=file_id)
    fh = open(download_path, 'wb')
    downloader = request.execute()
    fh.write(downloader)
    fh.close()

def delete_file(service, file_id):
    service.files().delete(fileId=file_id).execute()

def main():
    while True:
        try:
            # 检查 API 金钥和令牌
            creds = None
            if os.path.exists(TOKEN_FILE):
                creds = Credentials.from_authorized_user_file(TOKEN_FILE)
            if not creds or not creds.valid:
                if creds and creds.expired and creds.refresh_token:
                    creds.refresh(Request())
                else:
                    flow = InstalledAppFlow.from_client_secrets_file(CLIENT_SECRET_FILE, SCOPES)
                    creds = flow.run_local_server(port=0)
                with open(TOKEN_FILE, 'w') as token:
                    token.write(creds.to_json())

            # 创建 Google Drive 服务
            service = build('drive', 'v3', credentials=creds)

            # 获取 recordings 文件夹中的所有文件
            results = service.files().list(q="name='recordings' and mimeType='application/vnd.google-apps.folder'",
                                           fields="files(id)").execute()
            folder_id = results.get('files', [])[0]['id'] if results.get('files', []) else None

            if folder_id:
                results = service.files().list(q=f"'{folder_id}' in parents",
                                               fields="files(id, name)").execute()
                files = results.get('files', [])

                for file in files:
                    file_id = file['id']
                    file_name = file['name']
                    download_file(service, file_id, os.path.join(DOWNLOAD_PATH, file_name))
                    delete_file(service, file_id)
                    print(f"已下載並刪除: {file_name}")

        except HttpError as e:
            print(f"發生錯誤: {e}")
            # 在此处处理错误，例如记录错误以进行进一步分析，然后继续执行

        # 等待下一次检查
        time.sleep(CHECK_INTERVAL)

if __name__ == '__main__':
    main()

