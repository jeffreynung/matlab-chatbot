function update_chatbot_lang(intents_file)

disp('Updating chatbot...')
[sents, labels, resps] = json2string(intents_file);
[tr_inputs, tr_outputs, bows] = intentsPreprocess(sents, labels);
[tr_inputs, tr_outputs, resps] = create_unknow_to_train(tr_inputs, tr_outputs, resps);

numInputs = size(tr_inputs, 2);
numOutpurs = length(categories(tr_outputs));

disp('Training chatbot...')
layers = create_layers(numInputs, numOutpurs);
opts = trainingOptions('adam', 'MaxEpochs', 1000, 'MiniBatchSize', 8, 'Plots', 'training-progress');
net = trainNetwork(tr_inputs, tr_outputs, layers, opts);
save('chatbot_lang.mat', 'net','resps','bows')
disp('Done')


function layers = create_layers(numIn, numOut)

layers = [featureInputLayer(numIn)
fullyConnectedLayer(8,"Name", "full1")
fullyConnectedLayer(8,"Name", "full2")
fullyConnectedLayer(numOut,"Name", "full3")
softmaxLayer('Name','softM')
classificationLayer("Name", "out")];

function [in, out, resps] = create_unknow_to_train(tr_inputs, tr_outputs, resps_)
in = [tr_inputs; zeros(1, size(tr_inputs, 2))];
out = [tr_outputs; 'unknown'];
unknow_resp = {'I don''t quite understand what you mean. Could you rephrase that?';...
    'I don''t get your point. I will try to learn on my next update.';...
    'Orz...What you say might already beyound my ability, please GOOGLE it instead.'};
resps = [resps_; table({'unknown'}, {''}, {unknow_resp}, 'VariableNames', {'tag','patterns', 'responses'})];
