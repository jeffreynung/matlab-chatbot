function [tr_inputs, tr_outputs, BOW] = intentsPreprocess(sentences, labels)

sent_low = lower(sentences);
sent_punc = erasePunctuation(sent_low);
sent_norm = normalizeWords(sent_punc);
sent_tok = tokenizedDocument(sent_norm);
BOW = bagOfWords(sent_tok);
tr_inputs = full(encode(BOW, sent_tok));
tr_outputs = categorical(labels);
