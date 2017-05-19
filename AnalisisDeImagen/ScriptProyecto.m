EliminaRojo;
Azul;
Blanco;
Verde;
Damas3 = imgtotal;

ArrayColor1 = Damas3(:,:,1);
ArrayColor2 = Damas3(:,:,2);
ArrayColor3 = Damas3(:,:,3);

%imshow(ArrayColor3);

%bynvar1 = im2bw(Damas2(:,:,1));
%bynvar2 = im2bw(Damas2(:,:,2));
%bynvar3 = im2bw(Damas2(:,:,3));

%%[A,B,C] = imfindcircles(bynvar1, [20 50], 'ObjectPolarity','dark');
%%[D,E,F] = imfindcircles(bynvar2, [20 50], 'ObjectPolarity','dark');
%%[G,H,I] = imfindcircles(bynvar3, [20 50], 'ObjectPolarity','dark');

x = size(ArrayColor1,1);
y = size(ArrayColor1,2);
ArrayColorRojo = zeros(size(ArrayColor1,1),size(ArrayColor1,2));
ArrayColorAmarillo = zeros(size(ArrayColor1,1),size(ArrayColor1,2));
ArrayColorAzul = zeros(size(ArrayColor1,1),size(ArrayColor1,2));
ArrayColorMagenta = zeros(size(ArrayColor1,1),size(ArrayColor1,2));
ArrayColorVerde = zeros(size(ArrayColor1,1),size(ArrayColor1,2));

for i=1:x
    for j=1:y
        if(ArrayColor1(i,j) > 200 && ArrayColor2(i,j) > 200 && ArrayColor3(i,j) < 100)
            ArrayColorAmarillo(i,j) = 0;
        else
            ArrayColorAmarillo(i,j) = 1;
        end
    end
end

for i=1:x
    for j=1:y
        if(ArrayColor1(i,j) > 200 && ArrayColor2(i,j) < 100 && ArrayColor3(i,j) < 100)
            ArrayColorRojo(i,j) = 0;
        else
            ArrayColorRojo(i,j) = 1;
        end
    end
end

for i=1:x
    for j=1:y
        if(ArrayColor1(i,j) > 200 && ArrayColor2(i,j) < 100 && ArrayColor3(i,j) > 200)
            ArrayColorMagenta(i,j) = 0;
        else
            ArrayColorMagenta(i,j) = 1;
        end
    end
end

for i=1:x
    for j=1:y
        if(ArrayColor1(i,j) < 100 && ArrayColor2(i,j) < 100 && ArrayColor3(i,j) > 140)
            ArrayColorAzul(i,j) = 0;
        else
            ArrayColorAzul(i,j) = 1;
        end
    end
end

for i=1:x
    for j=1:y
        if(ArrayColor1(i,j) < 150 && ArrayColor2(i,j) > 230 && ArrayColor3(i,j) < 150)
            ArrayColorVerde(i,j) = 0;
        else
            ArrayColorVerde(i,j) = 1;
        end
    end
end

bynvar1 = im2bw(ArrayColorRojo);
bynvar2 = im2bw(ArrayColorAmarillo);
bynvar3 = im2bw(ArrayColorAzul);
bynvar4 = im2bw(ArrayColorMagenta);
bynvar5 = im2bw(ArrayColorVerde);
[A,B,C] = imfindcircles(bynvar1, [20 200], 'ObjectPolarity','dark');
[D,E,F] = imfindcircles(bynvar2, [20 200], 'ObjectPolarity','dark');
[G,H,I] = imfindcircles(bynvar3, [20 200], 'ObjectPolarity','dark');
[J,K,L] = imfindcircles(bynvar4, [15 200], 'ObjectPolarity','dark');
[M,N,P] = imfindcircles(bynvar5, [15 200],  'ObjectPolarity','dark');


MatrizJuego = zeros(8,8);
x = size(MatrizJuego,1);
y = size(MatrizJuego,2);


%Centro2 = 128-180x, 6-50y
%Centro3 = 254-300x, 6-50y
%Centro4 = 380-430x, 6-50y
z = size(A,1);

for k=1:z
    A(k)
    A(size(A,1)+k)
    if((A(k) > 6 && A(k) < 50) && (A(size(A,1)+k) > 6 && (A(size(A,1)+k) < 50)))
        MatrizJuego(1,1) = 1;
    end
    if((A(k) > 120 && A(k) < 160) && (A(size(A,1)+k) > 6 && (A(size(A,1)+k) < 50)))
        MatrizJuego(1,3) = 1;
    end
end


MatrizJuego