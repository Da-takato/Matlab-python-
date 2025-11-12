% example_basic.m
% MATLABからPythonを呼び出す基本的な例

%% Python環境の確認
fprintf('=== Python環境の確認 ===\n');
pe = pyenv;
fprintf('Python Version: %s\n', pe.Version);
fprintf('Python Executable: %s\n', pe.Executable);
fprintf('\n');

%% 基本的なPython実行
fprintf('=== 基本的なPython実行 ===\n');

% 簡単な計算
result = pyrun("x = 5 + 3", "x");
fprintf('5 + 3 = %d\n', result);

% Python組み込み関数の使用
pyList = py.list({10, 20, 30, 40, 50});
list_sum = py.sum(pyList);
fprintf('List sum: %d\n', list_sum);
fprintf('\n');

%% カスタムPython関数の呼び出し
fprintf('=== カスタムPython関数の呼び出し ===\n');

% Pythonパスにカレントディレクトリを追加
if count(py.sys.path, pwd) == 0
    insert(py.sys.path, int32(0), pwd);
end

% 関数の呼び出し
sum_result = py.my_functions.add_numbers(15, 27);
fprintf('add_numbers(15, 27) = %d\n', sum_result);

% リストを使った関数
numbers = py.list({1, 2, 3, 4, 5});
doubled = py.my_functions.multiply_list(numbers, 2);
fprintf('multiply_list([1,2,3,4,5], 2) = ');
disp(doubled);

% フィボナッチ数列の生成
fib_seq = py.my_functions.fibonacci(int32(10));
fprintf('fibonacci(10) = ');
disp(fib_seq);
fprintf('\n');

%% Pythonクラスの使用
fprintf('=== Pythonクラスの使用 ===\n');

% Calculatorクラスのインスタンス作成
calc = py.my_functions.Calculator('MyCalculator');
fprintf('Calculator名: %s\n', string(calc.name));

% 計算の実行
add_result = calc.calculate('add', 10, 5);
fprintf('10 + 5 = %.2f\n', add_result);

multiply_result = calc.calculate('multiply', 7, 6);
fprintf('7 × 6 = %.2f\n', multiply_result);

divide_result = calc.calculate('divide', 20, 4);
fprintf('20 ÷ 4 = %.2f\n', divide_result);

% 計算履歴の取得
history = calc.get_history();
fprintf('\n計算履歴:\n');
for i = 0:py.len(history)-1
    record = history{i};
    fprintf('  %s: %.2f %s %.2f = %.2f\n', ...
        string(record{'operation'}), ...
        double(record{'x'}), ...
        string(record{'operation'}), ...
        double(record{'y'}), ...
        double(record{'result'}));
end
fprintf('\n');

%% テキスト処理
fprintf('=== テキスト処理 ===\n');

text_result = py.my_functions.process_text('Hello from MATLAB');
fprintf('Original: %s\n', string(text_result{'original'}));
fprintf('Uppercase: %s\n', string(text_result{'uppercase'}));
fprintf('Length: %d\n', double(text_result{'length'}));
fprintf('Word count: %d\n', double(text_result{'word_count'}));

fprintf('\n=== 実行完了 ===\n');
