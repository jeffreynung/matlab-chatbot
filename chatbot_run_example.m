%% 聊天機器人使用範例(中文)
load('chatbot_lang_cht.mat')
sents = "Whats up";
disp(sents)

topics = pred_topics(net, bows, sents);
tp_idx = find(strcmp(resps.tag, string(topics)));
responses = resps.responses{tp_idx};
disp(responses{randi(length(responses))})
