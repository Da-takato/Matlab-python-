% example_numpy.m
% MATLABからNumPyを使用する例

fprintf('=== NumPyの使用例 ===\n\n');

% NumPyモジュールのインポート
try
    np = py.importlib.import_module('numpy');
    fprintf('NumPy successfully imported!\n');
    fprintf('NumPy version: %s\n\n', string(np.__version__));
catch ME
    fprintf('Error: NumPyがインストールされていません。\n');
    fprintf('以下のコマンドでインストールしてください:\n');
    fprintf('  pip install numpy\n');
    return;
end

%% NumPy配列の作成と基本操作
fprintf('=== NumPy配列の作成 ===\n');

% 配列の作成
arr1 = np.array([1, 2, 3, 4, 5]);
fprintf('Array: ');
disp(arr1);

% 統計関数
mean_val = double(np.mean(arr1));
std_val = double(np.std(arr1));
fprintf('Mean: %.2f\n', mean_val);
fprintf('Std: %.2f\n', std_val);
fprintf('\n');

%% 2次元配列
fprintf('=== 2次元配列 ===\n');

% 2次元配列の作成
matrix = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
fprintf('Matrix:\n');
disp(matrix);

% 行列の形状
shape = matrix.shape;
fprintf('Shape: %d x %d\n', shape{1}, shape{2});
fprintf('\n');

%% 線形代数
fprintf('=== 線形代数 ===\n');

% 行列の転置
transposed = matrix.T;
fprintf('Transposed matrix:\n');
disp(transposed);

% 行列式の計算
linalg = py.importlib.import_module('numpy.linalg');
try
    det_val = double(linalg.det(matrix));
    fprintf('Determinant: %.2f\n', det_val);
catch
    fprintf('Note: 特異行列のため、行列式を計算できません\n');
end
fprintf('\n');

%% 数学関数
fprintf('=== 数学関数 ===\n');

% 三角関数
x = np.linspace(0, 2*pi, 10);
y_sin = np.sin(x);
y_cos = np.cos(x);

fprintf('Sin values: ');
disp(y_sin);
fprintf('Cos values: ');
disp(y_cos);
fprintf('\n');

%% 配列の操作
fprintf('=== 配列の操作 ===\n');

% 配列の結合
arr2 = np.array([6, 7, 8, 9, 10]);
concatenated = np.concatenate(py.tuple({arr1, arr2}));
fprintf('Concatenated array: ');
disp(concatenated);

% 配列のリシェイプ
reshaped = np.reshape(concatenated, py.tuple({int32(2), int32(5)}));
fprintf('Reshaped (2x5):\n');
disp(reshaped);
fprintf('\n');

%% MATLABとNumPyの相互変換
fprintf('=== MATLABとNumPyの相互変換 ===\n');

% MATLAB配列からNumPy配列へ
matlab_array = [1 2 3; 4 5 6; 7 8 9];
numpy_array = np.array(matlab_array);
fprintf('MATLAB to NumPy:\n');
disp(numpy_array);

% NumPy配列からMATLAB配列へ
back_to_matlab = double(numpy_array);
fprintf('NumPy to MATLAB:\n');
disp(back_to_matlab);

fprintf('\n=== 実行完了 ===\n');
