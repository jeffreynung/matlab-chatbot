# MATLAB Chatbot

示範如何利用MATLAB和深度學習創造出簡單的聊天機器人，在JSON檔中輸入聊天機器人可以設定主題(tag)、問題或可能遇到的語句(patterns)、以及其回覆(responses)。MATLAB會依照該JSON檔中的句子製作bag-of-words，用結果做為特徵訓練深度學習分類模型。問題或回覆可為中文或英文，若有中文需要安裝python和jieba斷詞。

