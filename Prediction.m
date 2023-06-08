
function [err,num_vec,y_pred] = Prediction(x_test,y_test,x_train,PARAMETER,theta)
    weights = PARAMETER.Value;
    used    = PARAMETER.Relevant;
     
    n = size(x_train,2);
    if used(end) == n+1
        b            = weights(end);
        used(end)    = [];
        weights(end) = [];
    else
        b= 0;
    end
    
    PHI = Kernel(x_test,x_train(used),theta);
    y_pred  = PHI*weights + b ;  
    err     = sqrt(mean((y_test- y_pred).^2)); 
    num_vec = length(used);
end