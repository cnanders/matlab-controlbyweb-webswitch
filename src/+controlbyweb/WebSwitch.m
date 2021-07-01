classdef WebSwitch < controlbyweb.AbstractWebSwitch
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    % NOTES 2021.07.01
    % This device uses webread for every call rather than establishing
    % a dedicated TCPIP connection.  I'm going to set this up a lot like
    % matlab-delta-tau-power-pmac
    %
    % where we do one request for the state and store it until the next 
    % call comes in that could change state.  I like this a lot.  
    % Some variable called lNeedsRefresh that is set to true on any set()  
    % and gets set to false after the next get fulfilment
    
    properties (SetAccess = private)
        
        % {char 1xm} tcp/ip host
        cHost = '192.168.1.2'
        
        lNeedsRefresh = true;
        lIsOn = [false false]; % storage
                
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
        
            this.lNeedsRefresh = true;
                    
        end
        
        % Turns on relay 1
        function turnOffRelay1(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay1State', 0 ...
            );
        
            this.lNeedsRefresh = true;

                    
        end
        
        % Turns on relay 2
        function turnOnRelay2(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay2State', 1 ...
            );
            this.lNeedsRefresh = true;

                    
        end
        
        % Turns on relay 1
        function turnOffRelay2(this)
                      
            data = webread(...
                this.getUrl(), ...
                'relay2State', 0 ...
            );
        
            this.lNeedsRefresh = true;

                    
        end
        
        % Makes call to hardware to get state; sets local storage with
        % answer; and sets lNeedsRefresh to false.   lNeedsRefresh is
        % set true by any set coommand
        
        function updateRelayState(this)
            
            if ~this.lNeedsRefresh
                return
            end

            
            cXml = webread(...
                this.getUrl() ...
            );

            [cMatch, ceTok] = regexp(cXml, ...
                '<relay1state>([0-9,]+)<\/relay1state>', ...
                'match', ...
                'tokens' ...
             );

            this.lIsOn(1) = ceTok{1}{1} == '1';
            
            [cMatch, ceTok] = regexp(cXml, ...
                '<relay2state>([0-9,]+)<\/relay2state>', ...
                'match', ...
                'tokens' ...
             );
         
            this.lIsOn(2) = ceTok{1}{1} == '1';
            
            this.lNeedsRefresh = false;
            
            
        end
        
        function l = isOnRelay1(this)
            
            if this.lNeedsRefresh
                this.updateRelayState();
            end
            
            % return local state
            l = this.lIsOn(1);

        end
        
        function l = isOnRelay2(this)
            
            if this.lNeedsRefresh
                this.updateRelayState();
            end
            
            % return local state
            l = this.lIsOn(2);
            
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

