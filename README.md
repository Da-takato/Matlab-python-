<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# matlabからpython呼び起こし

step0
matlabのバージョンに対応したpythonをダウンロードする。
参照（https://jp.mathworks.com/support/requirements/python-compatibility.html）

step1
matlabのコマンドウィンドウにて、pyenvと入力する。

参考の写真

![matlab-python接続_step1](picture\matlab-pythonstep1.png)

もし、pythonのversionが出力されない場合は参照を確認して実行する
参照(https://jp.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html)

Home: "C:\Users\()※アカウント名\AppData\Local\Programs\Python\Python()※version"
出力された""内をコピーする。

step2
Windows powershellを開き、C:\Users\()※アカウント名\AppData\Local\Programs\Python\Python()※version\Scripts\pip.exe install pyserial
と入力する。

参考の写真

![matlab-python接続_step2](picture\matlab-pythonstep2.png)

と同じ結果になれば終了です


