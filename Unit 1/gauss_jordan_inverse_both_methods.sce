clc;
funcprot(0);   //if variables are redefined do nothing
format('v',10);
matrix1 = input("Enter a matrix[NxN]: ");

function gauss_jordan_inverse(matrix1)
    
    n = length(matrix1(1,:));
    augmented_matrix = [matrix1,eye(n,n)];
    
    //forward elimination
    for j=1:n-1
        for i=j+1:n
            augmented_matrix(i,j:2*n) = augmented_matrix(i,j:2*n) - augmented_matrix(i,j)/augmented_matrix(j,j)*augmented_matrix(j,j:2*n)
        end
    end
    
    //backward elimination
    for j=n:-1:2
            augmented_matrix(1:j-1,:) = augmented_matrix(1:j-1,:) - augmented_matrix(1:j-1,j)/augmented_matrix(j,j)*augmented_matrix(j,:)
    end
    
    //Diagonal Normalization
    for j=1:n
        augmented_matrix(j,:) = augmented_matrix(j,:) / augmented_matrix(j,j);
    end
    
    inverse = augmented_matrix(:,n+1:2*n);
    disp(inverse,'The Inverse of the matrix is ');
    
endfunction


function gauss_jordan_inverse_alternate(matrix1)
    n = length(matrix1(1,:));
    augmented_matrix = [matrix1,eye(n,n)];
    N = 1:n;
    for i=1: n
        dummy_var = N;
        dummy_var(i) = [];
        index(i,:) = dummy_var;
    end
    //foward elimination
    for j = 1:n
        [dummy_var2, t] = max(abs(augmented_matrix(j:n,j)));
        lrow = t+j-1;
        augmented_matrix([j,lrow],:) = augmented_matrix([lrow,j],:);
        augmented_matrix(j,:) = augmented_matrix(j,:)/augmented_matrix(j,j);
        for i=index(j,:)
            augmented_matrix(i,:) = augmented_matrix(i,:) - augmented_matrix(i,j)/augmented_matrix(j,j)*augmented_matrix(j,:)
        end
    end
    inverse = augmented_matrix(:,n+1:2*n)
    disp(inverse,'The Inverse of the matrix through alternate method is ');
endfunction

//calling function
gauss_jordan_inverse(matrix1);
gauss_jordan_inverse_alternate(matrix1);
