function varargout = Temporary_GUI(varargin)
% TEMPORARY_GUI MATLAB code for Temporary_GUI.fig
%      TEMPORARY_GUI, by itself, creates a new TEMPORARY_GUI or raises the existing
%      singleton*.
%
%      H = TEMPORARY_GUI returns the handle to a new TEMPORARY_GUI or the handle to
%      the existing singleton*.
%
%      TEMPORARY_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPORARY_GUI.M with the given input arguments.
%
%      TEMPORARY_GUI('Property','Value',...) creates a new TEMPORARY_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temporary_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temporary_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temporary_GUI

% Last Modified by GUIDE v2.5 31-May-2016 16:36:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temporary_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Temporary_GUI_OutputFcn, ...
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


% --- Executes just before Temporary_GUI is made visible.
function Temporary_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temporary_GUI (see VARARGIN)

% Choose default command line output for Temporary_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temporary_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Temporary_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%***************************popup 6 is Octave**********************
% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%*********************popup 7 is pitch*************************
% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see0 GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
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
synthDuration= get(handles.edit4,'String');
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
octaveVal= get(handles.popupmenu6,'Value');
pitchLetter = get(handles.popupmenu7,'Value');
waveShape= get(handles.popupmenu8,'Value');


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


switch get(handles.sampleSelectorMenu,'Value');
    case 1
        S1File= audiowrite('S1File.wav', synthArray,fs);
    case 2 
        S2File= audiowrite('S2File.wav',synthArray,fs);
    case 3
        S3File= audiowrite('S3File.wav',synthArray,fs);
    case 4
        S4File= audiowrite('S4File.wav',synthArray,fs);
    case 5
        S5File= audiowrite('S5File.wav',synthArray,fs);        
    case 6
        S6File= audiowrite('S6File.wav',synthArray,fs);    
    case 7
        S7File= audiowrite('S7File.wav',synthArray,fs);
    case 8
        S8File= audiowrite('S8File.wav',synthArray,fs);
    case 9
        S9File= audiowrite('S9File.wav',synthArray,fs);        
    case 10
        S10File= audiowrite('S10File.wav',synthArray,fs);
    case 11
        S11File= audiowrite('S11File.wav',synthArray,fs);        
    case 12
        S12File= audiowrite('S12File.wav',synthArray,fs);  
    case 13
        S13File= audiowrite('S13File.wav',synthArray,fs);
    case 14
        S14File= audiowrite('S14File.wav',synthArray,fs);
    case 15
        S15File= audiowrite('S15File.wav',synthArray,fs);        
    case 16
        S16File= audiowrite('S16File.wav',synthArray,fs); 
end
    
% If the preview checkbox is checked, play the tone
if handles.previewBox~=0
    sound(synthArray,fs);
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in previewBox.
function previewBox_Callback(hObject, eventdata, handles)
% hObject    handle to previewBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of previewBox
handles.previewBox=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on key press with focus on popupmenu7 and none of its controls.
function popupmenu7_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on selection change in sampleSelectorMenu.
function sampleSelectorMenu_Callback(hObject, eventdata, handles)
% hObject    handle to sampleSelectorMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sampleSelectorMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sampleSelectorMenu


% --- Executes during object creation, after setting all properties.
function sampleSelectorMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleSelectorMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
