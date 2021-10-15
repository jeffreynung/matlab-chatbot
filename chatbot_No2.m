function chatbot_No2()
warning off
load('chatbot_lang_cht.mat')
cont = true;

i = 1;
while cont
    if i == 1
        prompt = 'Cbot : Hi there! what can I help you?\nYou:';
        sents = input(prompt, 's');
    else
        sents = input('You : ', 's');
    end
    
    if ismember(lower(sents), {'quit', 'exit'})
        disp('Thanks for your time. See ya and have a nice day!')
        cont = false;
        break
    end
    topics = pred_topics(net, bows, sents);
    tp_idx = find(strcmp(resps.tag, string(topics)));
    responses = resps.responses{tp_idx};
    rand_resp_id = randi([1, length(responses)],1);
    disp(['Cbot : ', responses{rand_resp_id}]);
    i = i+1;
end
warning on