# ビルド用イメージ (全部入りイメージ)
FROM nvcr.io/nvidia/deepstream-l4t:6.0-triton AS builder

WORKDIR /opt/nvidia/deepstream/deepstream/sources/objectDetector_Yolo

# YOLO モジュールのビルド (CUDA_VER は自動判定)
RUN CUDA_VER=$(find /usr/local -maxdepth 1 -type d -name 'cuda-*' | sed -E 's/^.+-([^-]+)$/\1/') make -C nvdsinfer_custom_impl_Yolo
# YOLOv3 トレーニング済みモデルのダウンロード
RUN wget https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg -q --show-progress
RUN wget https://pjreddie.com/media/files/yolov3.weights -q --show-progress

# ----------

# ベースイメージ (最小限のイメージ)
FROM nvcr.io/nvidia/deepstream-l4t:6.0-base

# パッケージのインストール
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# deepstream-app バイナリファイル
COPY --from=builder /opt/nvidia/deepstream/deepstream/bin/deepstream-app /opt/nvidia/deepstream/deepstream/bin/deepstream-app
# deepstream-app 共通コンフィグファイル
COPY --from=builder /opt/nvidia/deepstream/deepstream/samples/configs/deepstream-app /opt/nvidia/deepstream/deepstream/samples/configs/deepstream-app
# サンプル動画が必要な場合、以下を有効化
# COPY --from=builder /opt/nvidia/deepstream/deepstream/samples/streams /opt/nvidia/deepstream/deepstream/samples/streams
# YOLO モジュール・コンフィグ・モデルファイル
COPY --from=builder /opt/nvidia/deepstream/deepstream/sources/objectDetector_Yolo /opt/nvidia/deepstream/deepstream/sources/objectDetector_Yolo

# deepstream-app のシンボリックリンクを張りコマンド名のみで実行できるように
RUN ln -s /opt/nvidia/deepstream/deepstream/bin/deepstream-app /usr/bin/deepstream-app

# 起動直後のカレントディレクトリを変更
WORKDIR /opt/nvidia/deepstream/deepstream/sources/objectDetector_Yolo
