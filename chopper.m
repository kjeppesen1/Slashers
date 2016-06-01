function varargout = chopper(varargin)
% CHOPPER MATLAB code for chopper.fig
%      CHOPPER, by itself, creates a new CHOPPER or raises the existing
%      singleton*.
%
%      H = CHOPPER returns the handle to a new CHOPPER or the handle to
%      the existing singleton*.
%
%      CHOPPER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOPPER.M with the given input arguments.
%
%      CHOPPER('Property','Value',...) creates a new CHOPPER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chopper_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chopper_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chopper

% Last Modified by GUIDE v2.5 31-May-2016 17:48:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chopper_OpeningFcn, ...
                   'gui_OutputFcn',  @chopper_OutputFcn, ...
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


% --- Executes just before chopper is made visible.
function chopper_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chopper (see VARARGIN)

% Choose default command line output for chopper
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chopper wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% global sampleData sampleRate; %loads in global variables
% %%%
% [sampleData,sampleRate] = audioread('strangers.wav'); %reads song file
% %This above line will not be in main program due to loading song task!!!
% axes(handles.axes1); %refernces the axes in GUI
% x=1:size(sampleData,1); %sets generic x values for plot
% plot(x,sampleData); %plots the sound wave onto axes



% --- Outputs from this function are returned to the command line.
function varargout = chopper_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sliderStart_Callback(hObject, eventdata, handles)
% hObject    handle to sliderStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global sliderStartValue;
sliderStartValue=get(handles.sliderStart,'Value');
%finds new slider value

% --- Executes during object creation, after setting all properties.
function sliderStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

global sliderStartValue;
sliderStartValue=get(handles.sliderStart,'Value'); 
%sets variable w/ initial start slider value

% --- Executes on slider movement.
function sliderEnd_Callback(hObject, eventdata, handles)
% hObject    handle to sliderEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global sliderEndValue;
sliderEndValue=get(handles.sliderEnd,'Value');
%finds new slider value

% --- Executes during object creation, after setting all properties.
function sliderEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

global sliderEndValue;
sliderEndValue=get(handles.sliderEnd,'Value'); 
%sets variable w/ initial end slider value

% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear sound; %stops all audio

% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global sampleData sampleRate sliderStartValue sliderEndValue; 
%loads in global variables
if(sliderStartValue>=sliderEndValue)
    msgbox('Start value must come before end value.');
    %warns user if sliders are in invalid locations
elseif (sliderStartValue==0)
    dataSize=size(sampleData,1); %finds number of rows
    startPoint=1; 
    %sets start point for song to play
    endPoint=round(sliderEndValue*dataSize);
    %sets end point for song to play
    playData=sampleData(startPoint:endPoint,:);
    %makes new data array with new start/end slider values
    sound(playData,sampleRate);
    %plays the song with those values
else
    dataSize=size(sampleData,1); %finds number of rows
    startPoint=round(sliderStartValue*dataSize); 
    %sets start point for song to play
    endPoint=round(sliderEndValue*dataSize);
    %sets end point for song to play
    playData=sampleData(startPoint:endPoint,:);
    %makes new data array with new start/end slider values
    sound(playData,sampleRate);
    %plays the song with those values
end

% --- Executes on button press in cropButton.
function cropButton_Callback(hObject, eventdata, handles)
% hObject    handle to cropButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global sampleData sampleRate sliderStartValue sliderEndValue;
%loads in global variables
if(sliderStartValue>=sliderEndValue)
    msgbox('Start value must come before end value.');
    %warns user if sliders are in invalid locations
elseif (sliderStartValue==0)
    dataSize=size(sampleData,1); %finds number of rows
    startPoint=1; 
    %sets start point for song to play
    endPoint=round(sliderEndValue*dataSize);
    %sets end point for song to play
    sampleData=sampleData(startPoint:endPoint,:);
    %resizes sampleData to new chop conditions
    axes(handles.axes1); %references the axes in GUI
    x=1:size(sampleData,1); %sets generic x values for plot
    plot(x,sampleData); %plots the sound wave onto axes
else
    dataSize=size(sampleData,1); %finds number of rows
    startPoint=round(sliderStartValue*dataSize); 
    %sets start point for song to play
    endPoint=round(sliderEndValue*dataSize);
    %sets end point for song to play
    sampleData=sampleData(startPoint:endPoint,:);
    %resizes sampleData to new chop conditions
    axes(handles.axes1); %references the axes in GUI
    x=1:size(sampleData,1); %sets generic x values for plot
    plot(x,sampleData); %plots the sound wave onto axes
end


% --- Executes on button press in playS1.
function playS1_Callback(hObject, eventdata, handles)
% hObject    handle to playS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S1File S1Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S1File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS1.
function loadS1_Callback(hObject, eventdata, handles)
% hObject    handle to loadS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S1File S1Path
[S1File, S1Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS1,'String',S1File);
%changes name of sample button

% --- Executes on button press in playS2.
function playS2_Callback(hObject, eventdata, handles)
% hObject    handle to playS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S2File S2Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S2File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS2.
function loadS2_Callback(hObject, eventdata, handles)
% hObject    handle to loadS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S2File S2Path
[S2File, S2Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS2,'String',S2File);
%changes name of sample button

% --- Executes on button press in playS3.
function playS3_Callback(hObject, eventdata, handles)
% hObject    handle to playS3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S3File S3Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S3File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS3.
function loadS3_Callback(hObject, eventdata, handles)
% hObject    handle to loadS3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S3File S3Path
[S3File, S3Path] = uigetfile('*.wav','Select a wav file');%user selects wav
set(handles.playS3,'String',S3File);
%changes name of sample button

% --- Executes on button press in playS5.
function playS5_Callback(hObject, eventdata, handles)
% hObject    handle to playS5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S5File S5Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S5File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS5.
function loadS5_Callback(hObject, eventdata, handles)
% hObject    handle to loadS5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S5File S5Path
[S5File, S5Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS5,'String',S5File);
%changes name of sample button

% --- Executes on button press in playS6.
function playS6_Callback(hObject, eventdata, handles)
% hObject    handle to playS6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S6File S6Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S6File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS6.
function loadS6_Callback(hObject, eventdata, handles)
% hObject    handle to loadS6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S6File S6Path
[S6File, S6Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS6,'String',S6File);
%changes name of sample button

% --- Executes on button press in playS7.
function playS7_Callback(hObject, eventdata, handles)
% hObject    handle to playS7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S7File S7Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S7File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS7.
function loadS7_Callback(hObject, eventdata, handles)
% hObject    handle to loadS7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S7File S7Path
[S7File, S7Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS7,'String',S7File);
%changes name of sample button

% --- Executes on button press in playS9.
function playS9_Callback(hObject, eventdata, handles)
% hObject    handle to playS9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S9File S9Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S9File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS9.
function loadS9_Callback(hObject, eventdata, handles)
% hObject    handle to loadS9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S9File S9Path
[S9File, S9Path] = uigetfile('*.wav','Select a wav file');%user selects wav
set(handles.playS9,'String',S9File);
%changes name of sample button

% --- Executes on button press in playS10.
function playS10_Callback(hObject, eventdata, handles)
% hObject    handle to playS10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S10File S10Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S10File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS10.
function loadS10_Callback(hObject, eventdata, handles)
% hObject    handle to loadS10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S10File S10Path
[S10File, S10Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS10,'String',S10File);
%changes name of sample button
% --- Executes on button press in playS11.
function playS11_Callback(hObject, eventdata, handles)
% hObject    handle to playS11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S11File S11Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S11File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS11.
function loadS11_Callback(hObject, eventdata, handles)
% hObject    handle to loadS11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S11File S11Path
[S11File, S11Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS11,'String',S11File);
%changes name of sample button

% --- Executes on button press in playS13.
function playS13_Callback(hObject, eventdata, handles)
% hObject    handle to playS13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S13File S13Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S13File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS13.
function loadS13_Callback(hObject, eventdata, handles)
% hObject    handle to loadS13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S13File S13Path
[S13File, S13Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS13,'String',S13File);
%changes name of sample button

% --- Executes on button press in playS14.
function playS14_Callback(hObject, eventdata, handles)
% hObject    handle to playS14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S14File S14Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S14File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS14.
function loadS14_Callback(hObject, eventdata, handles)
% hObject    handle to loadS14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S14File S14Path
[S14File, S14Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS14,'String',S14File);
%changes name of sample button

% --- Executes on button press in playS15.
function playS15_Callback(hObject, eventdata, handles)
% hObject    handle to playS15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S15File S15Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S15File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS15.
function loadS15_Callback(hObject, eventdata, handles)
% hObject    handle to loadS15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S15File S15Path
[S15File, S15Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS15,'String',S15File);
%changes name of sample button

% --- Executes on button press in playS4.
function playS4_Callback(hObject, eventdata, handles)
% hObject    handle to playS4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S4File S4Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S4File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS4.
function loadS4_Callback(hObject, eventdata, handles)
% hObject    handle to loadS4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S4File S4Path
[S4File, S4Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS4,'String',S4File);
%changes name of sample button

% --- Executes on button press in playS8.
function playS8_Callback(hObject, eventdata, handles)
% hObject    handle to playS8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S8File S8Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S8File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS8.
function loadS8_Callback(hObject, eventdata, handles)
% hObject    handle to loadS8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S8File S8Path
[S8File, S8Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS8,'String',S8File);
%changes name of sample button

% --- Executes on button press in playS12.
function playS12_Callback(hObject, eventdata, handles)
% hObject    handle to playS12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S12File S12Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S12File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS12.
function loadS12_Callback(hObject, eventdata, handles)
% hObject    handle to loadS12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S12File S12Path
[S12File, S12Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS12,'String',S12File);
%changes name of sample button

% --- Executes on button press in playS16.
function playS16_Callback(hObject, eventdata, handles)
% hObject    handle to playS16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S16File S16Path sampleData sampleRate
[sampleData,sampleRate] = audioread(S16File); %reads song file
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes

% --- Executes on button press in loadS16.
function loadS16_Callback(hObject, eventdata, handles)
% hObject    handle to loadS16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S16File S16Path
[S16File, S16Path] = uigetfile('*.wav','Select a wav file');
%user selects wav
set(handles.playS16,'String',S16File);
%changes name of sample button


% --- Executes on selection change in octavePopup.
function octavePopup_Callback(hObject, eventdata, handles)
% hObject    handle to octavePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns octavePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from octavePopup


% --- Executes during object creation, after setting all properties.
function octavePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to octavePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function durationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to durationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationEdit as text
%        str2double(get(hObject,'String')) returns contents of durationEdit as a double


% --- Executes during object creation, after setting all properties.
function durationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pitchPopup.
function pitchPopup_Callback(hObject, eventdata, handles)
% hObject    handle to pitchPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pitchPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pitchPopup


% --- Executes during object creation, after setting all properties.
function pitchPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitchPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in waveshapePopup.
function waveshapePopup_Callback(hObject, eventdata, handles)
% hObject    handle to waveshapePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns waveshapePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from waveshapePopup


% --- Executes during object creation, after setting all properties.
function waveshapePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waveshapePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generateButton.
function generateButton_Callback(hObject, eventdata, handles)
% hObject    handle to generateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S1File S2File S3File S4File S5File S6File S7File S8File S9File S10File S11File S12File S13File S14File S15File S16File ;

%Get user's input for length of tone
synthDuration= get(handles.durationEdit,'String');
%return error if user did not input any number for duration
% If the user didn't enter a duration, send error message
if isempty(synthDuration)
    errordlg('You must set a duration when making a synthesizer tone');
    return;
end

% Convert the string to a number
synthDuration=str2double(synthDuration);
% If the user entered anything other than digits, display error message
if isnan(synthDuration)
    errordlg('Duration time must be a number','Synthesizer Error');
    return;
end

% If the duration is not within accepted range, display error message
if synthDuration>=60 || synthDuration<=0
    errordlg(['Please choose a duration less than a minute and greater'...
        ' than 0 seconds.']);
    return;
end

%retrieve values from popupmenus for octave and pitch
octaveVal= get(handles.octavePopup,'Value');
pitchLetter = get(handles.pitchPopup,'Value');
waveShape= get(handles.waveshapePopup,'Value');


n=3+12*octaveVal+pitchLetter;
% Find the pitch frequency from the key
pitch=440*2^((n-49)/12);

% Set the sample rate to 44.1kHz
fs=44100;

synthVolume= get(handles.synthVol,'Value');


%create a sine wave
t = linspace(0,synthDuration,44100*synthDuration); 
synthArray = sin(pitch*2*pi*t);

%if user chooses wave shape
if waveShape== 1;
    synthArray= synthArray*synthVolume;
elseif waveShape== 2;
    synthArray= square(synthArray)*synthVolume;
elseif waveShape ==3;
    synthArray= tripuls(synthArray)*synthVolume;
end


switch get(handles.samplePopup,'Value');
    case 1
        audiowrite('S1File.wav', synthArray,fs);
        S1File= 'S1File.wav';
        set(handles.playS1,'String','Custom');
    case 2 
        audiowrite('S2File.wav',synthArray,fs);
        S2File= 'S2File.wav';
        set(handles.playS2,'String','Custom');
    case 3
        audiowrite('S3File.wav',synthArray,fs);
        S3File= 'S3File.wav';
        set(handles.playS3,'String','Custom');
    case 4
        audiowrite('S4File.wav',synthArray,fs);
        S4File= 'S4File.wav';
        set(handles.playS4,'String','Custom');
    case 5
        audiowrite('S5File.wav',synthArray,fs);
        S5File= 'S5File.wav';
        set(handles.playS5,'String','Custom');
    case 6
        audiowrite('S6File.wav',synthArray,fs);
        S6File= 'S6File.wav';
        set(handles.playS6,'String','Custom');
    case 7
        audiowrite('S7File.wav',synthArray,fs);
        S7File= 'S7File.wav';
        set(handles.playS7,'String','Custom');
    case 8
        audiowrite('S8File.wav',synthArray,fs);
        S8File= 'S8File.wav';
        set(handles.playS8,'String','Custom');
    case 9
        audiowrite('S9File.wav',synthArray,fs);
        S9File= 'S9File.wav';
        set(handles.playS9,'String','Custom');
    case 10
        audiowrite('S10File.wav',synthArray,fs);
        S10File= 'S10File.wav';
        set(handles.playS10,'String','Custom');
    case 11
        audiowrite('S11File.wav',synthArray,fs);
        S11File='S11File.wav';
        set(handles.playS11,'String','Custom');
    case 12
        audiowrite('S12File.wav',synthArray,fs);
        S12File= 'S12File.wav';
        set(handles.playS12,'String','Custom');      
    case 13
        audiowrite('S13File.wav',synthArray,fs);
        S13File= 'S13File.wav';
        set(handles.playS13,'String','Custom');
    case 14
        audiowrite('S14File.wav',synthArray,fs);
        S14File= 'S14File.wav';
        set(handles.playS14,'String','Custom');     
    case 15
        audiowrite('S15File.wav',synthArray,fs); 
        S15File= 'S15File.wav';
        set(handles.playS15,'String','Custom');
    case 16
        audiowrite('S16File.wav',synthArray,fs); 
        S16File= 'S16File.wav';
        set(handles.play16,'String','Custom');
end
    
% If the preview checkbox is checked, play the tone
if handles.previewCheckbox~=0
    sound(synthArray,fs);
end

% --- Executes on button press in previewCheckbox.
function previewCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to previewCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of previewCheckbox

handles.previewCheckbox=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on slider movement.
function synthVol_Callback(hObject, eventdata, handles)
% hObject    handle to synthVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function synthVol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to synthVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in samplePopup.
function samplePopup_Callback(hObject, eventdata, handles)
% hObject    handle to samplePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns samplePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from samplePopup


% --- Executes during object creation, after setting all properties.
function samplePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reversal.
function reversal_Callback(hObject, eventdata, handles)
% hObject    handle to reversal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of reversal

global sampleData sampleRate
reverse=flipud(sampleData);
sampleData=reverse;
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes


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

audiosc(sampledata,sampleRate)

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
sampleData=left-right;

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