

function convImage = convolution(I,K)
[x y] = size(I); % extract limits of I
[i j] = size(K); % extract limits of K

h = rot90(K, 2); % rotate K 180 degrees

%here we calculate the dimension size for the box-kernel that we
%will use for the convolution
center = floor((size(h)+1)/2);
left = center(2) - 1;
right = j - center(2);
top = center(1) - 1;
bottom = i - center(1);
Rep = zeros(x + top + bottom, y + left + right);

%here we obtain the time shifted image
for z = 1 + top : x + top
    for w = 1 + left : y + left
        Rep(z,w) = I(z - top,w - left);
    end
end
%the convoluted image will be the same size as the input image
convImage = zeros(x,y);

%z,w are indexes for the image and q,s are indexes for the kernel
for z = 1 : x
    for w = 1 : y
        for q = 1 : i
            for s = 1 : j
                v = z - 1;
                u = w -1;
                convImage(z, w) = convImage(z, w) + (Rep(q + v, s + u) * h(q, s));
            end
        end
    end
end