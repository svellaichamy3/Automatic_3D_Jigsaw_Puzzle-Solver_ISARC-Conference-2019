function [F, Dist, f_str1, f_str2] = cyclicSubStringMatch_euc(in1,in2,th)

len1 = size(in1,1);
len2 = size(in2,1);
string1 = [in1; in1];
string2 = [in2; in2];

m=size(string1, 1);
n=size(string2, 1);

F = zeros(m+1, n+1);
sub = zeros(m+1, n+1);
ins = zeros(m+1, n+1);
del = zeros(m+1, n+1);

for i = 1:m
    for j = 1:n
        if pdist2(string1(i,:), string2(j,:)) <= th
            d = 1;
        else
            d = -1;
        end
        temp = max([0, F(i,j+1)-1, F(i+1,j)-1, F(i,j)+d]);
        F(i+1, j+1) = temp;
        if F(i,j+1)-1 == temp
            del(i+1,j+1) = 1;
        end
        if F(i+1,j)-1 == temp
            ins(i+1,j+1) = 1;
        end
        if F(i,j)+d == temp
            sub(i+1,j+1) = 1;
        end
    end
end

[row,col] = find(F==max(F(:)));
q = size(row,1);
% str1 = cell(q,1);
% str2 = cell(q,1);

for k = 1:q
    i = row(k);
    j = col(k);
    l = 1;
    m = 1;
    str1{k}.ind = [];
    str2{k}.ind = [];
    while F(i, j) ~= 0
        if l == 1
            str1{k}.string(1, :) = [i-1, 0, 0];
            str2{k}.string(1, :) = [j-1, 0, 0];
            l = l+1;
        end
        str1{k}.string(l, :) = string1(i-1, :);
        str2{k}.string(l, :) = string2(j-1, :);
        if sub(i, j) == 1
            if i-1 > len1
                str1{k}.ind(m) = i-1-len1;
            else
                str1{k}.ind(m) = i-1;
            end
            if j-1 > len2
                str2{k}.ind(m) = j-1-len2;
            else
                str2{k}.ind(m) = j-1;
            end
            i = i-1;
            j = j-1;
            m = m+1;
        elseif ins(i, j) == 1
            j = j-1;
        elseif del(i, j) == 1
            i = i-1;
        else
            break;
        end
        l = l+1;
    end
    str1{k}.string(l, :) = [i, 0, 0];
    str2{k}.string(l, :) = [j, 0, 0];
end

k = 1;
for i = 1:size(str1, 2)
    j = 1;
    flag = 0;
    while j < i
        if isequal(str1{j}.ind, str1{i}.ind) && isequal(str2{j}.ind, str2{i}.ind)
            flag = 1;
            break;
        end
        j = j+1;
    end
    if flag == 0 && size(str1{i}.ind,2)~=1
        f_str1{k} = str1{i};
        f_str2{k} = str2{i};
        k = k+1;
    end
end

if ~(exist('f_str1', 'var') || exist('f_str2','var')) 
    f_str1 = [];
    f_str2 = [];
end

Dist = zeros(size(f_str1, 2),1);
for k = 1:size(f_str1, 2)
%     string1(str1{k}.ind)
%     string2(str2{k}.ind)
    if isempty(string1(f_str1{k}.ind)) || isempty(string1(f_str2{k}.ind))
        Dist(k,1) = 999;
    else
        Dist(k,1) = EditDist_euc(string1(f_str1{k}.ind, :), string2(f_str2{k}.ind, :),th);
    end
end