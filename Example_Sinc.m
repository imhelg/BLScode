

%%%%%%     Example Sinc function    %%%%%%

sde     = 0.1; 
x_train = linspace(-10,10,100);
y_train = (sin(x_train)./x_train + normrnd(0,sde,[1,size(x_train,2)]))';   
x_test  = linspace(-10,10,1000);
y_test  = (sin(x_test)./x_test)'; 
    
likelihood_='Gaussian';
LIKELIHOOD = BLS_Likelihoods(likelihood_);

kernp = 0.1;   
PHI   = Kernel(x_train,x_train,kernp);          
PHI   = [PHI,ones(size(x_train,2),1)];
     
[PARAMETER_est,HYPERPARAMETER_est,DIAGNOSTIC] = BLS(likelihood_, PHI, y_train);
[err,num_vec, y_pred] = Prediction(x_test, y_test, x_train, PARAMETER_est, kernp);
    
vec_used = [PARAMETER_est.Relevant];
vec_used(end) = [];

% Plot 
pcol = [255,0,0]/255; 
figure
hold on
set(gca,'color', 'w')
colors = get(gca,'colororder');
plot(x_test,y_test,'MarkerFaceColor',pcol,'MarkerEdgeColor','none','LineWidth',1)
plot(x_train,y_train,'.','Color','k','MarkerSize',8)
 
plot(x_test,y_pred,'Color',colors(5,:),'MarkerSize',8,'LineWidth',1.3)
plot(x_train(vec_used),y_train(vec_used),'.','Color','r','MarkerSize',15)

grid on 
hold off 










