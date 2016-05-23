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

% Last Modified by GUIDE v2.5 22-May-2016 19:16:26

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

global sampleData sampleRate; %loads in global variables
%%%
[sampleData,sampleRate] = audioread('strangers.wav'); %reads song file
%This above line will not be in main program due to loading song task!!!
axes(handles.axes1); %refernces the axes in GUI
x=1:size(sampleData,1); %sets generic x values for plot
plot(x,sampleData); %plots the sound wave onto axes



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
