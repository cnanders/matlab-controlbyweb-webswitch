classdef AbstractWebSwitch < handle
    
    
    methods (Abstract)
        
        
        turnOnRelay1(this)
        turnOffRelay1(this)
        turnOnRelay2(this)
        turnOffRelay2(this)
        
        l = isOnRelay1(this)
        l = isOnRelay2(this)
                
        
    end
    
    
end

