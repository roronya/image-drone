# image-drone
## vagrant-googleで試しながらイメージを作る。
### VM立ち上げる。

```bash
$ make vagrant_up
```

### ansibleの変更を適用する。

```bash
$ make vagrant_provision
```

### VMを終了する。

```bash
$ make vagrant_destroy
```

## packerでイメージを作る
デフォルトではdevにイメージが作られます。

```bash
$ make packer_build
```

makeの引数としてENVにstgやprdを渡すと渡された環境にイメージを作ります。

```bash
$ make ENV=prd packer_build
```

## tips
### 鍵管理
全てgcsに入れてgsutil catで環境変数に束縛する。
HashiCorpのツールは環境変数へのアクセス方法があるので、その方法を知っておくべき。
deployスクリプトを書いても良いがMakefileでやると依存関係が定義てぎて便利。

### Vagrantで設定したほうが良いディレクティブ
### packerで設定したほうが良いディレクティブ
### ansibleでdockerをインストール
### DRONE_HOST
#### GITHUのauthorizeurl
