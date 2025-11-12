# Matlab-python-
MatlabでPythonを呼び出す方法です

## 目次
- [前提条件](#前提条件)
- [基本的なPython実行](#基本的なpython実行)
- [Python関数の呼び出し](#python関数の呼び出し)
- [データ型の変換](#データ型の変換)
- [Pythonライブラリの使用](#pythonライブラリの使用)
- [実践的な例](#実践的な例)
- [トラブルシューティング](#トラブルシューティング)

## 前提条件

MATLABからPythonを呼び出すには、以下が必要です：

1. MATLAB R2014b以降
2. Python 2.7, 3.7, 3.8, 3.9, 3.10のいずれか（MATLABのバージョンに依存）
3. PythonがシステムのPATHに追加されていること

### Python環境の確認

```matlab
% Pythonのバージョンを確認
pyenv

% 特定のPythonを指定（必要に応じて）
pyenv('Version', 'C:\Python39\python.exe')
```

## 基本的なPython実行

### 簡単なPythonコマンドの実行

```matlab
% Pythonの式を評価
result = pyrun("print('Hello from Python!')", "result");

% Python変数を作成
x = pyrun("x = 5 + 3", "x");
disp(x)  % 8
```

### Pythonコードブロックの実行

```matlab
% 複数行のPythonコードを実行
code = sprintf(['import math\n' ...
               'result = math.sqrt(16)\n' ...
               'print(f"Square root: {result}")']);
pyrun(code);
```

## Python関数の呼び出し

### 組み込み関数の使用

```matlab
% Pythonの組み込み関数を呼び出す
pyList = py.list({'apple', 'banana', 'cherry'});
disp(pyList)

% len関数を使用
length = py.len(pyList);
disp(length)  % 3
```

### カスタムPythonファイルの作成と呼び出し

まず、Pythonファイルを作成します（`my_functions.py`）：

```python
# my_functions.py
def add_numbers(a, b):
    """2つの数値を加算"""
    return a + b

def multiply_list(lst, factor):
    """リストの各要素を係数倍"""
    return [x * factor for x in lst]

class Calculator:
    def __init__(self, name):
        self.name = name
    
    def calculate(self, operation, x, y):
        if operation == 'add':
            return x + y
        elif operation == 'multiply':
            return x * y
        else:
            return None
```

MATLABから呼び出す：

```matlab
% Pythonファイルのあるディレクトリをパスに追加
if count(py.sys.path, pwd) == 0
    insert(py.sys.path, int32(0), pwd);
end

% Python関数を呼び出す
result = py.my_functions.add_numbers(10, 20);
disp(result)  % 30

% リストを渡す
numbers = py.list({1, 2, 3, 4, 5});
multiplied = py.my_functions.multiply_list(numbers, 2);
disp(multiplied)  % [2, 4, 6, 8, 10]

% Pythonクラスを使用
calc = py.my_functions.Calculator('MyCalc');
result = calc.calculate('add', 5, 3);
disp(result)  % 8
```

## データ型の変換

### MATLABからPythonへ

```matlab
% MATLAB配列 → Pythonリスト
matlabArray = [1, 2, 3, 4, 5];
pythonList = py.list(matlabArray);

% MATLAB文字列 → Python文字列
matlabStr = "Hello";
pythonStr = py.str(matlabStr);

% MATLAB構造体 → Python辞書
matlabStruct.name = 'John';
matlabStruct.age = 30;
pythonDict = py.dict(matlabStruct);

% MATLAB行列 → NumPy配列（NumPyがインストールされている場合）
matlabMatrix = [1 2 3; 4 5 6];
npArray = py.numpy.array(matlabMatrix);
```

### PythonからMATLABへ

```matlab
% Pythonリスト → MATLAB配列
pythonList = py.list({1, 2, 3, 4, 5});
matlabArray = double(pythonList);

% Python辞書 → MATLAB構造体
pythonDict = py.dict(pyargs('name', 'John', 'age', 30));
keys = cell(pythonDict.keys());
values = cell(pythonDict.values());

% NumPy配列 → MATLAB行列
% npArray = py.numpy.array([[1, 2, 3], [4, 5, 6]]);
% matlabMatrix = double(npArray);
```

## Pythonライブラリの使用

### NumPyの使用

```matlab
% NumPy配列の作成と操作
np = py.importlib.import_module('numpy');
arr = np.array([1, 2, 3, 4, 5]);
mean_val = np.mean(arr);
disp(double(mean_val))  % 3

% 数学的な操作
x = np.linspace(0, 2*pi, 100);
y = np.sin(x);
```

### Pandasの使用

```matlab
% Pandasデータフレームの作成
pd = py.importlib.import_module('pandas');
data = py.dict(pyargs(...
    'Name', py.list({'Alice', 'Bob', 'Charlie'}), ...
    'Age', py.list({25, 30, 35}), ...
    'City', py.list({'Tokyo', 'Osaka', 'Kyoto'})));
df = pd.DataFrame(data);

% データフレームの表示
disp(df)

% 統計情報の取得
disp(df.describe())
```

### Matplotlibの使用

```matlab
% Matplotlibでプロット
plt = py.importlib.import_module('matplotlib.pyplot');
x = py.numpy.linspace(0, 2*pi, 100);
y = py.numpy.sin(x);

plt.figure();
plt.plot(x, y);
plt.title('Sine Wave');
plt.xlabel('x');
plt.ylabel('sin(x)');
plt.grid(py.True);
plt.show();
```

## 実践的な例

### 例1: 画像処理（OpenCVを使用）

Pythonファイル（`image_processing.py`）：

```python
# image_processing.py
import cv2
import numpy as np

def apply_gaussian_blur(image_path, kernel_size=5):
    """画像にガウシアンブラーを適用"""
    img = cv2.imread(image_path)
    blurred = cv2.GaussianBlur(img, (kernel_size, kernel_size), 0)
    return blurred

def detect_edges(image_path, threshold1=100, threshold2=200):
    """Cannyエッジ検出を適用"""
    img = cv2.imread(image_path, 0)
    edges = cv2.Canny(img, threshold1, threshold2)
    return edges
```

MATLABから呼び出し：

```matlab
% パスの追加
if count(py.sys.path, pwd) == 0
    insert(py.sys.path, int32(0), pwd);
end

% 画像処理の実行
blurred = py.image_processing.apply_gaussian_blur('sample.jpg', int32(7));
edges = py.image_processing.detect_edges('sample.jpg', int32(50), int32(150));
```

### 例2: 機械学習（scikit-learnを使用）

```matlab
% scikit-learnで簡単な分類
sklearn_datasets = py.importlib.import_module('sklearn.datasets');
sklearn_svm = py.importlib.import_module('sklearn.svm');

% データのロード
iris = sklearn_datasets.load_iris();
X = iris.data;
y = iris.target;

% SVMモデルの訓練
clf = sklearn_svm.SVC(pyargs('kernel', 'linear'));
clf.fit(X, y);

% 予測
sample = py.numpy.array([[5.1, 3.5, 1.4, 0.2]]);
prediction = clf.predict(sample);
disp(prediction)
```

### 例3: JSON処理

```matlab
% JSONデータの読み込みと処理
json_module = py.importlib.import_module('json');

% JSON文字列をPython辞書に変換
json_str = '{"name": "Taro", "age": 25, "city": "Tokyo"}';
py_dict = json_module.loads(json_str);

% Python辞書からMATLABへ
name = char(py_dict{'name'});
age = double(py_dict{'age'});
disp(['Name: ' name ', Age: ' num2str(age)])

% MATLAB構造体をJSONに変換
data.name = 'Hanako';
data.age = 28;
data.hobbies = {'reading', 'swimming'};
json_output = char(json_module.dumps(py.dict(data)));
disp(json_output)
```

## トラブルシューティング

### よくある問題と解決策

#### 1. Pythonが見つからない

```matlab
% 現在のPython環境を確認
pe = pyenv;
disp(pe)

% Pythonの実行ファイルパスを明示的に指定
pyenv('Version', '/usr/bin/python3.9')
```

#### 2. Pythonモジュールがインポートできない

```matlab
% Pythonパスを確認
py.sys.path

% カレントディレクトリを追加
insert(py.sys.path, int32(0), pwd);

% 特定のディレクトリを追加
insert(py.sys.path, int32(0), '/path/to/your/python/modules');
```

#### 3. データ型の変換エラー

```matlab
% int32, double などで明示的に変換
pythonInt = int32(42);
pythonFloat = double(3.14);

% セル配列をPythonリストに
matlabCell = {1, 2, 3};
pythonList = py.list(matlabCell);
```

#### 4. Pythonライブラリがインストールされていない

MATLABからは直接pipを実行できないため、システムのコマンドラインで：

```bash
# コマンドライン（MATLABの外）で実行
pip install numpy pandas matplotlib scikit-learn opencv-python
```

または、MATLABから：

```matlab
% システムコマンドとして実行（Windows）
system('pip install numpy');

% システムコマンドとして実行（Mac/Linux）
system('pip3 install numpy');
```

#### 5. MATLABとPythonのバージョン互換性

MATLABのバージョンによってサポートされるPythonのバージョンが異なります：

- MATLAB R2021a: Python 2.7, 3.7, 3.8
- MATLAB R2021b: Python 3.8, 3.9
- MATLAB R2022a以降: Python 3.8, 3.9, 3.10

詳細は公式ドキュメントを確認してください。

### デバッグのヒント

```matlab
% Pythonのエラーメッセージを表示
try
    result = py.some_module.some_function();
catch e
    disp(e.message)
    disp(e.identifier)
end

% Python側でデバッグ出力
pyrun("import sys; print(sys.version)");
pyrun("import os; print(os.getcwd())");
```

## 参考資料

- [MATLAB公式ドキュメント - Call Python from MATLAB](https://www.mathworks.com/help/matlab/call-python-libraries.html)
- [Python公式ドキュメント](https://docs.python.org/)
- MathWorks File Exchange（MATLAB-Pythonインテグレーションの例）
