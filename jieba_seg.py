# -*- coding: utf-8 -*-

def jieba_seg(inputs):
    import jieba
    import jieba.posseg as pseg
    import logging
    
    jieba.setLogLevel(logging.INFO)
    jieba.set_dictionary('dict.txt.big')
    jieba.load_userdict("my.dict.txt")
    
    words = jieba.cut(inputs)
    
    return_word=''
    for w in words:
        return_word = return_word+','+w
    return return_word