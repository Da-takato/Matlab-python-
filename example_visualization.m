% example_visualization.m
% MATLABからPythonのMatplotlibを使用する例

fprintf('=== Matplotlibによる可視化の例 ===\n\n');

% 必要なモジュールのインポート
try
    np = py.importlib.import_module('numpy');
    plt = py.importlib.import_module('matplotlib.pyplot');
    fprintf('NumPy and Matplotlib successfully imported!\n\n');
catch ME
    fprintf('Error: 必要なライブラリがインストールされていません。\n');
    fprintf('以下のコマンドでインストールしてください:\n');
    fprintf('  pip install numpy matplotlib\n');
    return;
end

%% サイン・コサイン波のプロット
fprintf('=== サイン・コサイン波のプロット ===\n');

% データの生成
x = np.linspace(0, 2*pi, 100);
y_sin = np.sin(x);
y_cos = np.cos(x);

% プロットの作成
plt.figure(pyargs('figsize', py.tuple({int32(10), int32(6)})));
plt.plot(x, y_sin, pyargs('label', 'sin(x)', 'linewidth', int32(2)));
plt.plot(x, y_cos, pyargs('label', 'cos(x)', 'linewidth', int32(2)));
plt.title('Sine and Cosine Waves');
plt.xlabel('x');
plt.ylabel('y');
plt.legend();
plt.grid(py.True);
plt.savefig('sine_cosine.png', pyargs('dpi', int32(100)));
fprintf('Graph saved as sine_cosine.png\n\n');
plt.close();

%% ヒストグラムの作成
fprintf('=== ヒストグラムの作成 ===\n');

% ランダムデータの生成（正規分布）
random = py.importlib.import_module('numpy.random');
data = random.randn(1000);

% ヒストグラムのプロット
plt.figure(pyargs('figsize', py.tuple({int32(8), int32(6)})));
plt.hist(data, pyargs('bins', int32(30), 'alpha', 0.7, 'color', 'blue'));
plt.title('Normal Distribution Histogram');
plt.xlabel('Value');
plt.ylabel('Frequency');
plt.grid(py.True, pyargs('alpha', 0.3));
plt.savefig('histogram.png', pyargs('dpi', int32(100)));
fprintf('Histogram saved as histogram.png\n\n');
plt.close();

%% 散布図の作成
fprintf('=== 散布図の作成 ===\n');

% ランダムデータの生成
n = int32(50);
x_scatter = random.rand(n);
y_scatter = random.rand(n);
colors = random.rand(n);
sizes = random.randint(20, 200, n);

% 散布図のプロット
plt.figure(pyargs('figsize', py.tuple({int32(8), int32(6)})));
plt.scatter(x_scatter, y_scatter, ...
    pyargs('c', colors, 's', sizes, 'alpha', 0.6, 'cmap', 'viridis'));
plt.colorbar();
plt.title('Random Scatter Plot');
plt.xlabel('X axis');
plt.ylabel('Y axis');
plt.grid(py.True, pyargs('alpha', 0.3));
plt.savefig('scatter.png', pyargs('dpi', int32(100)));
fprintf('Scatter plot saved as scatter.png\n\n');
plt.close();

%% 複数のサブプロット
fprintf('=== 複数のサブプロット ===\n');

% データの準備
x = np.linspace(0, 10, 100);

% 4つのサブプロットを持つ図を作成
fig_subplots = plt.figure(pyargs('figsize', py.tuple({int32(12), int32(8)})));

% サブプロット1: 線形
plt.subplot(int32(2), int32(2), int32(1));
plt.plot(x, x, 'r-');
plt.title('Linear');
plt.grid(py.True);

% サブプロット2: 二次関数
plt.subplot(int32(2), int32(2), int32(2));
plt.plot(x, np.power(x, 2), 'b-');
plt.title('Quadratic');
plt.grid(py.True);

% サブプロット3: 指数関数
plt.subplot(int32(2), int32(2), int32(3));
plt.plot(x, np.exp(x/5), 'g-');
plt.title('Exponential');
plt.grid(py.True);

% サブプロット4: 対数関数
plt.subplot(int32(2), int32(2), int32(4));
plt.plot(x, np.log(x + 1), 'm-');
plt.title('Logarithmic');
plt.grid(py.True);

plt.tight_layout();
plt.savefig('subplots.png', pyargs('dpi', int32(100)));
fprintf('Subplots saved as subplots.png\n\n');
plt.close();

%% 棒グラフ
fprintf('=== 棒グラフ ===\n');

% データの準備
categories = py.list({'A', 'B', 'C', 'D', 'E'});
values = py.list({23, 45, 56, 78, 32});

% 棒グラフの作成
plt.figure(pyargs('figsize', py.tuple({int32(8), int32(6)})));
plt.bar(categories, values, pyargs('color', 'skyblue', 'edgecolor', 'navy'));
plt.title('Bar Chart Example');
plt.xlabel('Category');
plt.ylabel('Value');
plt.grid(py.True, pyargs('axis', 'y', 'alpha', 0.3));
plt.savefig('barchart.png', pyargs('dpi', int32(100)));
fprintf('Bar chart saved as barchart.png\n\n');
plt.close();

fprintf('=== 実行完了 ===\n');
fprintf('生成されたファイル:\n');
fprintf('  - sine_cosine.png\n');
fprintf('  - histogram.png\n');
fprintf('  - scatter.png\n');
fprintf('  - subplots.png\n');
fprintf('  - barchart.png\n');
