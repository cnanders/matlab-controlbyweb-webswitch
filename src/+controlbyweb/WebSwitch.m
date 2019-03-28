classdef WebSwitch < AbstractWebSwitch
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        
        % {char 1xm} tcp/ip host
        cHost = '192.168.1.2'
                
    end
    
    methods
        
        function this = WebSwitch(varargin) 
            
            for k = 1 : 2: length(varargin)
                % this.msg(sprintf('passed in %s', varargin{k}));
                if this.hasProp( varargin{k})
                    % this.msg(sprintf('settting %s', varargin{k}));
                    this.(varargin{k}) = varargin{k + 1};
                end
            end
                        
        end
        
        % Turns on relay 1
        function turnOnRelay1(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay1State', 1 ...
            );
                    
        end
        
        % Turns on relay 1
        function turnOffRelay1(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay1State', 0 ...
            );
                    
        end
        
        % Turns on relay 2
        function turnOnRelay2(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay2State', 1 ...
            );
                    
        end
        
        % Turns on relay 1
        function turnOffRelay2(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay2State', 0 ...
            );
                    
        end
        
        
        function l = isOnRelay1(this)
            
            cXml = webread(...
                this.getUrl() ...
            );
        
            [cMatch, ceTok] = regexp(cXml, ...
                '<relay1state>([0-9,]+)<\/relay1state>', ...
                'match', ...
                'tokens' ...
             );
                     
            l = ceTok{1}{1} == '1';

        end
        
        function l = isOnRelay2(this)
            
            cXml = webread(...
                this.getUrl() ...
            );
        
            [cMatch, ceTok] = regexp(cXml, ...
                '<relay2state>([0-9,]+)<\/relay2state>', ...
                'match', ...
                'tokens' ...
             );
         
             l = ceTok{1}{1} == '1';

            
        end
        
        
        
    end
    
    methods (Access = private)
        
        function l = hasProp(this, c)
            
            l = false;
            if ~isempty(findprop(this, c))
                l = true;
            end
            
        end
        
        function c = getUrl(this)
             c = sprintf('http://%s/state.xml', this.cHost);
        end
       
        
    end
    
end

