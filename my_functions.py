# my_functions.py
"""
MATLABから呼び出すためのサンプルPython関数
"""

def add_numbers(a, b):
    """
    2つの数値を加算
    
    Parameters:
    -----------
    a : float or int
        最初の数値
    b : float or int
        2番目の数値
    
    Returns:
    --------
    float or int
        a + b の結果
    """
    return a + b


def multiply_list(lst, factor):
    """
    リストの各要素を係数倍
    
    Parameters:
    -----------
    lst : list
        数値のリスト
    factor : float or int
        乗算する係数
    
    Returns:
    --------
    list
        各要素が係数倍されたリスト
    """
    return [x * factor for x in lst]


def process_text(text):
    """
    テキストを処理（大文字化と文字数カウント）
    
    Parameters:
    -----------
    text : str
        処理するテキスト
    
    Returns:
    --------
    dict
        処理結果を含む辞書
    """
    return {
        'original': text,
        'uppercase': text.upper(),
        'length': len(text),
        'word_count': len(text.split())
    }


class Calculator:
    """簡単な計算機クラス"""
    
    def __init__(self, name):
        """
        Parameters:
        -----------
        name : str
            計算機の名前
        """
        self.name = name
        self.history = []
    
    def calculate(self, operation, x, y):
        """
        算術演算を実行
        
        Parameters:
        -----------
        operation : str
            演算の種類 ('add', 'subtract', 'multiply', 'divide')
        x : float
            最初のオペランド
        y : float
            2番目のオペランド
        
        Returns:
        --------
        float
            演算結果
        """
        if operation == 'add':
            result = x + y
        elif operation == 'subtract':
            result = x - y
        elif operation == 'multiply':
            result = x * y
        elif operation == 'divide':
            if y != 0:
                result = x / y
            else:
                raise ValueError("ゼロ除算はできません")
        else:
            raise ValueError(f"未知の演算: {operation}")
        
        self.history.append({
            'operation': operation,
            'x': x,
            'y': y,
            'result': result
        })
        
        return result
    
    def get_history(self):
        """計算履歴を返す"""
        return self.history
    
    def clear_history(self):
        """計算履歴をクリア"""
        self.history = []


def fibonacci(n):
    """
    フィボナッチ数列のn番目までを生成
    
    Parameters:
    -----------
    n : int
        生成する項数
    
    Returns:
    --------
    list
        フィボナッチ数列
    """
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    
    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[i-1] + fib[i-2])
    
    return fib
