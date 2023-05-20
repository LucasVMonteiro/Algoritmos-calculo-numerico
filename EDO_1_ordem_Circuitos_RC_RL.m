# Calculos EDO 1 ordem circuitos
clc, clear all, close all, format long
R = 8;
C = 2;
V = 24;
t0 = 0;
Q0 = 0;
t = 0:100;
K = -48/3;
Q = V.*C + (V./R).*K.*exp(-t./(R.*C));
Vc = Q/C;
I = 3.*exp(-t./16);


t1 = 16;
Qt = V.*C + (V./R).*K.*exp(-t1./(R.*C))

subplot(2,2,1)
plot(t,Q,'k-');
title("Q(t) x t");
grid on
axis([0 max(t) min(Q) max(Q)])

subplot(2,2,2)
plot(t, Vc,'g-');
title("V(t) x t");
grid on
axis([0 max(t) min(Vc) max(Vc)])

subplot(2,2,3)
plot(t, I,'c-');
title("I(t) x t");
grid on
axis([0 max(t) min(I) max(I)])

##subplot(2,2,4)
##loglog(t,Q,'y-',t, Vc,'m-',t, I,'c-');
##title("Q(t) x t ; V(t) x t ; I(t) x t");
##grid on


for r = 1: 20
  Q = V.*C + (V./r).*K.*exp(-t./(r.*C));
  subplot(2,2,4)
  plot(t,Q,'y-');
  grid on
  hold on
end
