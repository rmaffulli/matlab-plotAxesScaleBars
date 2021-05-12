% plotAxesScaleBars: a MATLAB function to add scale bars to X and Y axes
% Copyright (C) 2021  Roberto Maffulli
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

function plotAxesScaleBars(xscale,yscale,origincoords,...
    thickness,color,xlabel,ylabel,labelssize,fontweight,whattoplot)
% This function removes the axes and substitutes them with a vertical and
% horizontal scale bar
% Inputs:
%  - xscale: size of the x axis scalebar (in real world physical units of
%  the x variable)
%  - yscale: size of the y axis scalebar  (in real world physical units of
%  the y variable)
%  - origincoords: coordinates where the 'origin' of the scalebars should
%  be placed (in real world physical units of the x and y variables)
%  - thickness: thickness of the scale bars (pts)
%  - color: color of scale bars
%  - xlabel: text label for x axis scale bar
%  - ylabel: text label for x axis scale bar
%  - labelsize: size for text of scale bars (pts)
%  - fontweight: font weight
%  - whattoplot: string to select what to plot (should be one of "xonly"
%  "yonly" or "bothaxes")

assert(ismember(whattoplot, ["xonly" "yonly" "bothaxes"]),...
    "Incorrect input argument 'whattoplot'");

% remove current axes
hold on
set(gca,'visible','off')
set(findall(gca, 'type', 'text'), 'visible', 'on')
% plot both x and y axes scale bars
if whattoplot == "bothaxes"
    h = plot([origincoords(1)+xscale origincoords(1) origincoords(1)],...
        [origincoords(2) origincoords(2) origincoords(2)+yscale],...
        'LineWidth', thickness, 'Color', color,...
        'Marker','none','DisplayName','');
    h.Annotation.LegendInformation.IconDisplayStyle = 'off';
    text(origincoords(1)+0.5*xscale,origincoords(2)-0.2*yscale, string(xscale) + " " + xlabel,'HorizontalAlignment','center',...
        'FontSize',labelssize,'FontWeight',fontweight);
    h = text(origincoords(1)-0.2*xscale,origincoords(2)+0.5*yscale, string(yscale) + " " + ylabel,'HorizontalAlignment','center',...
        'FontSize',labelssize,'FontWeight',fontweight);
    set(h,'Rotation',90);
% plot only x axis scale bar
elseif whattoplot == "xonly"
    h = plot([origincoords(1)+xscale origincoords(1)],...
        [origincoords(2) origincoords(2)],...
        'LineWidth', thickness, 'Color', color,...
        'Marker','none','DisplayName','');
    h.Annotation.LegendInformation.IconDisplayStyle = 'off';
    text(origincoords(1)+0.5*xscale,origincoords(2)-0.2*yscale, string(xscale) + " " + xlabel,'HorizontalAlignment','center',...
        'FontSize',labelssize,'FontWeight',fontweight);
% plot only y axis scale bar  
else
    h = plot([origincoords(1) origincoords(1)],...
        [origincoords(2) origincoords(2)+yscale],...
        'LineWidth', thickness, 'Color', color,...
        'Marker','none','DisplayName','');
    h.Annotation.LegendInformation.IconDisplayStyle = 'off';
    h = text(origincoords(1)-0.2*xscale,origincoords(2)+0.5*yscale, string(yscale) + " " + ylabel,'HorizontalAlignment','center',...
        'FontSize',labelssize,'FontWeight',fontweight);
    set(h,'Rotation',90);    
end
end

