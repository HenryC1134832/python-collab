import pyaudio
import wave
import os
import time
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

# 如果修改了 SCOPE，請刪除之前的 token.json。
SCOPES = ['https://www.googleapis.com/auth/drive.file']
CLIENT_SECRET_FILE = 'client_secret_5336721447-2ndqu0an2ban3f6dq88rdigbbjqcpodo.apps.googleusercontent.com.json'
APPLICATION_NAME = 'recorder'

def get_credentials():
    creds = None
    # token.json 存儲用戶的訪問和刷新令牌，第一次運行授權流程後自動創建。
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    # 如果沒有有效的憑證可用，讓用戶登錄。
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                CLIENT_SECRET_FILE, SCOPES)
            creds = flow.run_local_server(port=0)
        # 保存憑證以供下次運行使用
        with open('token.json', 'w') as token:
            token.write(creds.to_json())
    return creds

def build_service(creds):
    return build('drive', 'v3', credentials=creds)

def upload_file(service, file_path, file_name, folder_name):
    # 搜尋資料夾是否存在
    folder_query = f"name='{folder_name}' and mimeType='application/vnd.google-apps.folder'"
    folder_results = service.files().list(q=folder_query).execute()
    
    if not folder_results.get('files'):
        # 如果資料夾不存在，則創建一個
        folder_metadata = {'name': folder_name, 'mimeType': 'application/vnd.google-apps.folder'}
        folder = service.files().create(body=folder_metadata, fields='id').execute()
        folder_id = folder['id']
    else:
        # 如果資料夾已存在，使用現有資料夾的ID
        folder_id = folder_results['files'][0]['id']

    # 上傳檔案到指定資料夾
    file_metadata = {'name': file_name, 'parents': [folder_id]}
    media = MediaFileUpload(file_path, mimetype='audio/wav')
    file = service.files().create(body=file_metadata, media_body=media, fields='id').execute()
    print(f"Uploaded {file_name} to Google Drive in the '{folder_name}' folder with file ID: {file['id']}")

def delete_old_files(directory, days_to_keep):
    current_time = time.time()
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        # 檢查檔案的最後修改時間
        if os.path.isfile(file_path) and current_time - os.path.getmtime(file_path) > days_to_keep * 24 * 3600:
            os.remove(file_path)
            print(f"Deleted old file: {file_path}")

# 錄音配置和錄音過程
FORMAT = pyaudio.paInt16
CHANNELS = 4
RATE = 16000
CHUNK = 1024
RECORD_SECONDS = 30

# 設定音頻存儲目錄
if not os.path.exists('recordings'):
    os.makedirs('recordings')

audio = pyaudio.PyAudio()

# Google Drive 中的資料夾名稱
drive_folder_name = 'recordings'

while True:
    # 開始錄音
    stream = audio.open(format=FORMAT, channels=CHANNELS, rate=RATE, input=True, frames_per_buffer=CHUNK)
    print("recording...")
    frames = []

    for i in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
        data = stream.read(CHUNK)
        frames.append(data)
    print("finished recording")

    # 停止錄音
    stream.stop_stream()
    stream.close()

    # 保存 WAVE 檔案
    WAVE_OUTPUT_FILENAME = os.path.join('recordings', f"{time.strftime('%Y%m%d%H%M')}.wav")
    wf = wave.open(WAVE_OUTPUT_FILENAME, 'wb')
    wf.setnchannels(CHANNELS)
    wf.setsampwidth(audio.get_sample_size(FORMAT))
    wf.setframerate(RATE)
    wf.writeframes(b''.join(frames))
    wf.close()

    # 獲取憑證並建立服務
    creds = get_credentials()
    service = build_service(creds)

    # 上傳檔案到 Google Drive 的 'recordings' 資料夾
    upload_file(service, WAVE_OUTPUT_FILENAME, 
    os.path.basename(WAVE_OUTPUT_FILENAME), drive_folder_name)

    # 刪除7天前的本地檔案
    delete_old_files('recordings', days_to_keep=7)
