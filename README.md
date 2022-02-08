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

以下の動画は deepstream-yolo-on-jetson を活用した、試合中のサッカー選手をリアルタイムで検出・追跡するAIソリューションの例です。  

https://user-images.githubusercontent.com/91356865/152901401-09fe18ab-0ac7-444d-aeba-57027833a2d5.gif  


## DeepStream SDK について

DeepStream SDKは、NVIDIA社が提供しているAIベースのマルチセンサー処理やビデオ、音声、画像の理解のためのストリーミング分析ツールキットです。  
動画処理に必要な各種機能を、動画ストリームをパイプライン処理するためのフレームワークである Gstreamer のプラグインの形で提供しています。  
動画や画像を高速に処理することができるため、エッジデバイスやリアルタイムで画像処理する際によく使用されています。  

## YOLO について

YOLOとは、コンピューターが外部の物体を検出するときに使用される代表的な機械学習モデルです。  
画像をCNN（畳み込みニューラルネットワーク）に通すことで、オブジェクト検出を行います。  
YOLOのアルゴリズムは１つのCNNで完結するためシンプルであり、リアルタイムかつ高精度で処理できるという特徴があります。  


## Docker イメージのビルド

```sh
make docker-build
```

この Docker イメージのビルドと動作には、nvidia-container-runtime の利用が必須となります。

ビルドに失敗する場合は、次の操作を実行してください:

* [Docker 公式リポジトリ](https://docs.docker.com/engine/install/ubuntu/)から最新版の Docker をインストールしてください。
* `/etc/docker/daemon.json` に `"default-runtime": "nvidia"` を追加し、Docker を再起動してください。


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
