function SegmentLED(number)
  %segment = convertToSegment(number)
  positions = [4 7 1;
   1 10 0;
   1 4 0;
   4 1 1;
   7 4 0;
   7 10 0;
   4 13 1];
   segments = bit2Segment(number);
   for i = 1:size(positions)(1)
     drawSegment(positions(:,1:2)(i,:),positions(i,3),str2num(segments(i)));
   endfor
  
    
  function drawSegment(pos,ori,color)
    short = 1;
    long = 2;
    if color == 1
      color = 'red';
    else
      color = 'white';
    endif
    if ori == 0
      v = [pos(1)-short pos(2)-long 2*short 2*long];
    else
      v = [pos(1)-long pos(2)-short 2*long 2*short];
    endif
    rectangle("Position",v,"Curvature",1/2,"FaceColor",color);
  endfunction
  
  
endfunction
