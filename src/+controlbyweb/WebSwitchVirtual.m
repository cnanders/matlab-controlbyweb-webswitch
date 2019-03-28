classdef WebSwitchVirtual < AbstractWebSwitch
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        
        lIsOnRelay1 = false
        lIsOnRelay2 = false
                
    end
    
    methods
        
        function this = WebSwitchVirtual(varargin) 
            
            for k = 1 : 2: length(varargin)
                % this.msg(sprintf('passed in %s', varargin{k}));
                if this.hasProp( varargin{k})
                    % this.msg(sprintf('settting %s', varargin{k}));
                    this.(varargin{k}) = varargin{k + 1};
                end
            end
                        
        end
        
        function turnOnRelay1(this)
                      
            this.lIsOnRelay1 = true;
                    
        end
        
        function turnOffRelay1(this)
                      
            this.lIsOnRelay1 = false;
                    
        end
        
        function turnOnRelay2(this)
                      
            this.lIsOnRelay2 = true;
                    
        end
        
        function turnOffRelay2(this)
                      
            this.lIsOnRelay2 = false;
                    
        end
        
        
        function l = isOnRelay1(this)
            
            l = this.lIsOnRelay1;

        end
        
        function l = isOnRelay2(this)
            
            l = this.lIsOnRelay2;
            
        end
        
        
        
    end
    
    
    
end

