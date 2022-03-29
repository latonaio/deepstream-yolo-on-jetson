# deepstream-yolo-on-jetson

deepstream-yolo-on-jetson は、Jetson 上にインストールされた DeepStream SDK を使用して YOLOv3 による物体・人物検出を行うための Docker イメージです。  
DeepStream SDK のインストールについては、[deployment-base-setup-for-jetson](https://github.com/latonaio/deployment-base-setup-for-jetson)を参照してください。  

## 動作環境

* NVIDIA Jetson
	* JetPack 4.6
	* DeepStream 6.0
	* nvidia-container-runtime
* Docker
* Docker Compose v2
* GNU Make

## deepstream-yolo-on-jetsonを活用したAIソリューションの例

以下の動画は deepstream-yolo-on-jetson を活用したAIソリューションの例です。  

#### Car Traffic Detection

https://user-images.githubusercontent.com/91356865/155654109-c2714ff0-fde9-4f04-a724-8f7e439479ec.mp4

#### Car Type Color Detection

https://user-images.githubusercontent.com/91356865/155654565-c1d0872a-8742-4865-8cf0-fa7db924cb17.mp4

#### Person Detection  

https://user-images.githubusercontent.com/91356865/155654821-87033132-1c47-4355-a734-08dd20191078.mp4

#### Player Tracking in Football

https://user-images.githubusercontent.com/91356865/152901401-09fe18ab-0ac7-444d-aeba-57027833a2d5.gif  

#### Super Scrambling Car Detection

https://user-images.githubusercontent.com/91356865/155657180-fc7d8109-d0cc-4fe8-a1da-b10cc2170064.mp4

#### Car Licence Detection

https://user-images.githubusercontent.com/91356865/155662463-85aad9a4-7f19-40cc-aa43-43986766bf03.mov

## DeepStream SDK について

DeepStream SDKは、NVIDIA社が提供しているAIベースのマルチセンサー処理やビデオ、音声、画像の理解のためのストリーミング分析ツールキットです。  
動画処理に必要な各種機能を、動画ストリームをパイプライン処理するためのフレームワークである Gstreamer のプラグインの形で提供しています。  
動画や画像を高速に処理することができるため、エッジデバイスやリアルタイムで画像処理する際によく使用されています。  

## YOLO について

YOLOとは、コンピューターが外部の物体を検出するときに使用される代表的な機械学習モデルです。  
画像をCNN（畳み込みニューラルネットワーク）に通すことで、オブジェクト検出を行います。  
YOLOのアルゴリズムは１つのCNNで完結するためシンプルであり、リアルタイムかつ高精度で処理できるという特徴があります。  

## NVIDIA コンテナランタイムの有効化

Docker イメージをビルドするには、NVIDIAコンテナランタイムの有効化が必要です。
有効化手順は、[nvidia-container-runtime-validation](https://github.com/latonaio/nvidia-container-runtime-validation)を参照してください。  

## Docker イメージのビルド

以下のコマンドでDocker イメージをビルドしてください。  

```sh
make docker-build
```

## 実行

以下のコマンドを実行すると、シェルが起動します。

```sh
make launch
```

コンフィグファイルを必要に応じ書き換え、

```sh
deepstream-app -c [config.txt]
```

のように実行してください。
