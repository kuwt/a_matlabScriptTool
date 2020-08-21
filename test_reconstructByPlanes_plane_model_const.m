function [a,b,c,d] = test_reconstructByPlanes_plane_model_const(sol,ks,phi)
         a = sol(1) * ks(1);
         b = sol(2) * ks(2);
         c = sol(3) * ks(3);
         d = sol(4) * ks(4) * phi + sol(5);
end
