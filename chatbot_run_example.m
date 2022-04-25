%% 聊天機器人使用範例(English)
load('chatbot_lang.mat')
sents = "Whats up";
disp(sents)

topics = pred_topics(net, bows, sents);
tp_idx = find(strcmp(resps.tag, string(topics)));
responses = resps.responses{tp_idx};
disp(responses{randi(length(responses))})
