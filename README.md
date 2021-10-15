# MATLAB Chatbot

示範如何利用MATLAB和深度學習創造出簡單的聊天機器人，在JSON檔中輸入聊天機器人可以設定主題(tag)、問題或可能遇到的語句(patterns)、以及其回覆(responses)。MATLAB會依照該JSON檔中的句子製作bag-of-words，用結果做為特徵訓練深度學習分類模型。問題或回覆可為中文或英文，若有中文需要安裝python和jieba斷詞。

使用方法:
1. **開啟聊天機器人(純英文):**
`>> chatbot_No1()`

2. **開啟聊天機器人(中英文):**
`>> chatbot_No2()`

3. **新的JSON檔案重新訓練機器人:**
`>> update_chatbot_lang(your_intents_file)`

執行完畢後會覆蓋原本的chatbot_lang.mat，因此可重新執行
`>> chatbot_No1()`

**對話範例:**
`>> chatbot_No2`

Cbot : Hi there! what can I help you?
You:早安
Cbot : Hi!
You : 你叫什麼名字
Cbot : 我Cbot! 叫我西柏
You : 有什麼推薦的?
Cbot : 這裡有很厲害的MATLAB和Simulink，可以幫你省很多時間唷
You : 這裡有什麼好玩的?
Cbot : 這裡有很厲害的MATLAB和Simulink，可以幫你省很多時間唷
You : Age?
Cbot : I don't get your point. I will try to learn on my next update.
You : 我想買東西
Cbot : 想不想來點厲害的MATLAB和文字探勘工具箱?
You : cya
Cbot : Goodbye!


**Requirments:**
1. MATLAB R2020b and after
2. Deep Learning Toolbox
3. Text Analytics Toolobx
4. Statistics and Machine Learning Toolbox
5. Parallel Computing Toolbox

6. Python 3.8
7. Jieba 
