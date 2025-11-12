# クイックスタートガイド

このリポジトリを使ってすぐにMATLABからPythonを呼び出す方法を学べます。

## ステップ1: 必要な環境を確認

```matlab
% MATLABでPython環境を確認
pyenv
```

## ステップ2: サンプルを実行

### 基本的な例を試す
```matlab
% example_basic.m を実行
example_basic
```

### NumPyを使った例を試す（NumPyがインストールされている場合）
```matlab
% example_numpy.m を実行
example_numpy
```

### 可視化の例を試す（MatplotlibとNumPyがインストールされている場合）
```matlab
% example_visualization.m を実行
example_visualization
```

## ステップ3: 自分のPython関数を作成

1. `.py` ファイルを作成
2. MATLABからPythonパスに追加:
   ```matlab
   if count(py.sys.path, pwd) == 0
       insert(py.sys.path, int32(0), pwd);
   end
   ```
3. Python関数を呼び出す:
   ```matlab
   result = py.your_module.your_function(arg1, arg2);
   ```

## よくある問題

### Pythonが見つからない
```matlab
% Pythonのパスを指定
pyenv('Version', '/path/to/python')
```

### Pythonライブラリがない
コマンドライン（MATLABの外）で:
```bash
pip install numpy pandas matplotlib
```

詳しくは [README.md](README.md) をご覧ください。
