clear all;

close all;

% Chargement et affichage de l'image %

I = imread('ED_3_6_originale.png');

% I = imread('/ED_5_1_originale.png');

figure(1);

subplot(2,3,1);

imshow(I);

title('Image initiale');

% Création histogramme %

H = zeros(1,256);

K = [0:255];

[NL,NC] = size(I);

for i = 1:NL

    for j = 1:NC

        H(I(i,j)+1) = H(I(i,j)+1)+1;

    end

end

subplot(2,3,2);

plot(K,H);

title('Histogramme image seuiller');

% Seuillage %

for i = 1:NL

    for j = 1:NC

        if I(i,j) < 30

            I(i,j) = 0;

        else

            I(i,j) = 255;

        end

    end

end

subplot(2,3,3);

imshow(I);

title('Image Binarisée');

% Inversion de l'image (noir -> blanc, blanc -> noir) %

for i = 1:NL

    for j = 1:NC

        if I(i,j) == 0

            I(i,j) = 1;

        else

            I(i,j) = 0;

        end

    end

end

% Amincissement / Squelettisation  %

for  i = 2:NL-1

    for j = 2:NC-1

%         Calcul de A et B

        A = 0;

        B = 0;

        P = [I(i-1,j) I(i-1,j+1) I(i,j+1) I(i+1,j+1) I(i+1,j) I(i+1,j-1) I(i,j-1) I(i-1,j-1) I(i-1,j)];

        for k = 1:8

            if P(k+1)-P(k) == 1

               A = A + 1;

            end

        end

        B = sum(sum(I(i-1:i+1,j-1:j+1)))-I(i,j);

        

        if (A == 1) && (B <= 6) && (B >= 2) && (P(1)*P(3)*P(7) == 0) && (P(1)*P(3)*P(5) == 0)

            I(i,j) = 0;

        end

    end

end

subplot(2,3,4);

imshow(double(I));

title('Image squelettisée');


% Crossing number %

Minuties = zeros(NL,NC);

I = double(I);

subplot(2,3,5);

title('Carte des minuties');

for i = 2:NL-1

    for j = 2:NC-1

        if I(i,j) == 1

            S = 0;

            P = [I(i,j+1) I(i-1,j+1) I(i-1,j) I(i-1,j-1) I(i,j-1) I(i+1,j-1) I(i+1,j) I(i+1,j+1) I(i,j+1)];

            for k = 1:8 

                S = S + abs(P(k)-P(k+1));

            end

            S = S/2;

            switch S

                case 0

                    Minuties(i,j) = 1;

                    hold on;

                    plot(i,j,'xr');

%                 case 1

%                     Minuties(i,j) = 2;

%                     hold on;

%                     plot(i,j,'or');

%                 case 2

%                     Minuties(i,j) = 3;

%                     hold on;

%                     plot(i,j,'ob');

                case 3

                    Minuties(i,j) = 4;

                    hold on;

                    plot(i,j,'xb');

%                 case 4

%                     Minuties(i,j) = 5;

%                     hold on;

%                     plot(i,j,'oy');

            end

        end

    end

end





% Chargement et affichage de l'image %

I2 = imread('ED_3_6_originale.png');

%I2 = imread('/ED_5_1_originale.png');

figure(2);

subplot(2,3,1);

imshow(I2);

title('Image initiale');

% Création histogramme %

H = zeros(1,256);

K = [0:255];

[NL,NC] = size(I2);

for i = 1:NL

    for j = 1:NC

        H(I2(i,j)+1) = H(I2(i,j)+1)+1;

    end

end

subplot(2,3,2);

plot(K,H);

title('Histogramme image initiale');

% Seuillage %

for i = 1:NL

    for j = 1:NC

        if I2(i,j) < 30

            I2(i,j) = 0;

        else

            I2(i,j) = 255;

        end

    end

end

subplot(2,3,3);

imshow(I2);

title('Image Binarisée');

% Inversion de l'image (noir -> blanc, blanc -> noir) %

for i = 1:NL

    for j = 1:NC

        if I2(i,j) == 0

            I2(i,j) = 1;

        else

            I2(i,j) = 0;

        end

    end

end

% Amincissement / Squelettisation  %

for  i = 2:NL-1

    for j = 2:NC-1

%         Calcul de A et B

        A = 0;

        B = 0;

        P = [I2(i-1,j) I2(i-1,j+1) I2(i,j+1) I2(i+1,j+1) I2(i+1,j) I2(i+1,j-1) I2(i,j-1) I2(i-1,j-1) I2(i-1,j)];

        for k = 1:8

            if P(k+1)-P(k) == 1

               A = A + 1;

            end

        end

        B = sum(sum(I2(i-1:i+1,j-1:j+1)))-I2(i,j);

        

        if (A == 1) && (B <= 6) && (B >= 2) && (P(1)*P(3)*P(7) == 0) && (P(1)*P(3)*P(5) == 0)

            I2(i,j) = 0;

        end

    end

end

subplot(2,3,4);

imshow(double(I2));

title('Image squelettisée');


% Crossing number %

Minuties2 = zeros(NL,NC);

I2 = double(I2);

subplot(2,3,5);

title('Carte des minuties');

for i = 2:NL-1

    for j = 2:NC-1

        if I2(i,j) == 1

            S = 0;

            P = [I2(i,j+1) I2(i-1,j+1) I2(i-1,j) I2(i-1,j-1) I2(i,j-1) I2(i+1,j-1) I2(i+1,j) I2(i+1,j+1) I2(i,j+1)];

            for k = 1:8 

                S = S + abs(P(k)-P(k+1));

            end

            S = S/2;

            switch S

                case 0

                    Minuties2(i,j) = 1;

                    hold on;

                    plot(i,j,'xr');

%                 case 1

%                     Minuties(i,j) = 2;

%                     hold on;

%                     plot(i,j,'or');

%                 case 2

%                     Minuties(i,j) = 3;

%                     hold on;

%                     plot(i,j,'ob');

                case 3

                    Minuties2(i,j) = 4;

                    hold on;

                    plot(i,j,'xb');

%                 case 4

%                     Minuties(i,j) = 5;

%                     hold on;

%                     plot(i,j,'oy');

            end

        end

    end

end

% Comparaison des cartes de minuties %

res = true;

for i = 1:NL

    for j = 1:NC

        if Minuties(i,j) ~= Minuties2(i,j)

            res = false;

        end   

    end

end