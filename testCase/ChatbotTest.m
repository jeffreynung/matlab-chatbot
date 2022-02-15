classdef ChatbotTest < matlab.unittest.TestCase
    methods(Test)
        function predictsHellowTps(testCase)
            % Predicting the "greeting" label in ENG model
            load chatbot_lang.mat
            actSolution = pred_topics(net ,bows ,"Whats up");
            expSolution = 'greeting';
            testCase.verifyEqual(char(actSolution),expSolution)
        end
    end
end