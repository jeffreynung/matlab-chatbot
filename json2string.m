function [sentences, labels, resps] = json2string(intents_file)

fid = fopen(intents_file, 'r', 'n', 'UTF-8');
% raw = fread(fid, Inf);
% str = char(raw');
raw = textscan(fid, '%c', 'Whitespace', '');
str = raw{1}';
fclose(fid);
data = jsondecode(str);

num_tags = length(data.intents);
sents = cell(num_tags, 1);
labs = cell(num_tags, 1);

for i = 1:num_tags
    pat = string(data.intents(i).patterns)';
    sents{i} = pat;
    labs{i} = repmat(string(data.intents(i).tag), 1, length(pat));    
end

resps = struct2table(rmfield(data.intents, 'context_set'));
sentences = [sents{:}]';
labels = [labs{:}]';
