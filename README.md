# python-collab 語音分離模型

本專案包含多個 Python 和 Shell 腳本，用於語音處理、增強和評估。

## 1. 安裝環境

請先安裝所需的 Python 套件：
```sh
pip install -r requirements.txt
```

## 2. Python 腳本使用方式

### 資料處理
- `addnoise.py`：
  ```sh
  python addnoise.py --input <input_file> --output <output_file> --snr <snr_value>
  ```
  - 作用：為語音訊號添加噪聲。

- `audio_io_tutorial.py`：
  ```sh
  python audio_io_tutorial.py
  ```
  - 作用：示範基本的音訊輸入輸出。

- `audio_preprocessing_tutorial.py`：
  ```sh
  python audio_preprocessing_tutorial.py --input <input_wav>
  ```
  - 作用：展示音訊預處理步驟。

- `meta_json_arg.py`：
  ```sh
  python meta_json_arg.py --config <config.json>
  ```
  - 作用：處理 JSON 參數設定。

### 模型訓練與推論
- `trainer.py`：
  ```sh
  python trainer.py --config <config.json>
  ```
  - 作用：訓練語音增強模型。

- `model.py`：
  ```sh
  python model.py --load_model <model_path>
  ```
  - 作用：加載並測試語音模型。

- `inference_max.sh`：
  ```sh
  bash inference_max.sh <input_wav> <output_wav>
  ```
  - 作用：對語音進行推論。

### 語音評估
- `compute_pesq.sh`：
  ```sh
  bash compute_pesq.sh <clean_wav> <enhanced_wav>
  ```
  - 作用：計算 PESQ（語音客觀質量評估指標）。

- `compute_si_snr.py`：
  ```sh
  python compute_si_snr.py --clean <clean_wav> --enhanced <enhanced_wav>
  ```
  - 作用：計算 SI-SNR（語音訊噪比）。

- `compute_stoi.sh`：
  ```sh
  bash compute_stoi.sh <clean_wav> <enhanced_wav>
  ```
  - 作用：計算 STOI（語音可懂度指標）。

### 其他
- `recorderReceiver.py`：
  ```sh
  python recorderReceiver.py --output <output_wav>
  ```
  - 作用：錄音並存儲為 WAV 檔。

## 3. 其他 Shell 腳本

- `all_sisnr.sh`：批量計算 SI-SNR。
- `compute_snr_based_dB.sh`：計算 SNR。
- `denoiser_old.sh`：舊版語音降噪。

執行方式皆為：
```sh
bash <script_name.sh>
```

## 4. Windows 執行說明

本專案可在 Windows 下執行，建議使用 Windows Subsystem for Linux（WSL）來運行 Shell 腳本，或者直接使用 Python 腳本處理語音。

## 5. 版權與授權

本專案遵循 MIT 授權條款，詳細資訊請參閱 `LICENSE` 文件。


