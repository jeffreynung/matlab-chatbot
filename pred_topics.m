function label_hat = pred_topics(net, bows, sents)

sent_low = lower(sents);
sent_punc = erasePunctuation(sent_low);

if strcmp(corpusLanguage(sents), 'en')
    sent_tok = tokenizedDocument(sent_punc);
    sent_norm = normalizeWords(sent_tok);
    
else
    sent_tok = jieba(sent_punc);
    sent_tok = string(sent_tok);
    sent_norm = sent_tok(2:end);

end

in = full(encode(bows, sent_tok));
label_hat = classify(net, in);

function sent_seg = jieba(sent)
    penv = py.importlib.import_module('jieba_seg');
    ret = penv.jieba_seg(sent);
    ret = string(ret);
    sent_seg = string(strsplit(ret, ','));
