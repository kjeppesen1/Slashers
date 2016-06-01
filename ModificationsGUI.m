function varargout = ModificationsGUI(varargin)
% MODIFICATIONSGUI MATLAB code for ModificationsGUI.fig
%      MODIFICATIONSGUI, by itself, creates a new MODIFICATIONSGUI or raises the existing
%      singleton*.
%
%      H = MODIFICATIONSGUI returns the handle to a new MODIFICATIONSGUI or the handle to
%      the existing singleton*.
%
%      MODIFICATIONSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODIFICATIONSGUI.M with the given input arguments.
%
%      MODIFICATIONSGUI('Property','Value',...) creates a new MODIFICATIONSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ModificationsGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ModificationsGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ModificationsGUI

% Last Modified by GUIDE v2.5 31-May-2016 17:20:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ModificationsGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ModificationsGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ModificationsGUI is made visible.
function ModificationsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ModificationsGUI (see VARARGIN)

% Choose default command line output for ModificationsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ModificationsGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ModificationsGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reversal.
function reversal_Callback(hObject, eventdata, handles)
% hObject    handle to reversal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of reversal
global sampleData sampleRate
reverse=flipud(sampleData);


% --- Executes on button press in delay.
function delay_Callback(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of delay
global sampleData sampleRate
sampledata=sampleData;
N=10000;
for n=N+1:length(sampleData)
    sampledata(n)=sampleData(n)+sampleData(n-N)
end

% --- Executes on button press in tone.
function tone_Callback(hObject, eventdata, handles)
% hObject    handle to tone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tone
global sampleData sampleRate
sampledata=sampleData
for n=2:length(sampleData)
    
    sampledata(n,1)=.9*sampledata(n-1,1)+sampleData(n,1)
    sampledata(n,2)=.9*sampledata(n-1,2)+sampleData(n,2)
    
end

audiosc(sampladata,sampleRate)

% --- Executes on button press in speed.
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of speed
global sampleData sampleRate
audiosc(sampleData,sampleRate/1.5)
audiosc(sampleData,sampleRate*1.5)

% --- Executes on button press in voice.
function voice_Callback(hObject, eventdata, handles)
% hObject    handle to voice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of voice
global sampleData sampleRate
left=sampleData(:,1);
right=sampleData(:,2);
audiosc(left,sampleRate);
audiosc(left-right,sampleRate);


% --- Executes on button press in mono.
function mono_Callback(hObject, eventdata, handles)
% hObject    handle to mono (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mono
global sampleData sampleRate
left=sampleData(:,1);
right=sampleData(:,2);
Mono=(left+right)/2;

% --- Executes on button press in stereo.
function stereo_Callback(hObject, eventdata, handles)
% hObject    handle to stereo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stereo
