-- Rayfield Stable Fixed v1.2.0 by Astris Hub (79f59ec, 2026-09-28)
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au={function()local b,c,d=a(1)local e return(
function(...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.
types)export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type ProgressProps=j.ProgressProps export
type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type DividerProps=j.DividerProps export type
NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.
PopupOption export type PopupProps=j.PopupProps export type Moveable=j.Moveable export type Lockable=j.Lockable export
type Window=j.Window export type Tab=j.Tab export type Group=j.Group export type Button=j.Button export type Toggle=j.
Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.
Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat export type Progress=j.Progress export type
Console=j.Console export type Section=j.Section export type TabSection=j.TabSection export type Text=j.Text export type
Divider=j.Divider export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new
:(j.WindowProps)->j.Window}local k={}::Rayfield local function l()local m=Instance.new'ScreenGui'm.Name=f.httpService:
GenerateGUID(false)m.ClipToDeviceSafeArea=false m.DisplayOrder=i.displayOrder.banner m.IgnoreGuiInset=true m.
ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=Enum.SafeAreaCompatibility.None m.ScreenInsets=Enum.
ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.Sibling m.Parent=f.guiContainer local n=Instance.new
'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.
Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.Parent=m return m end function k.CreateWindow(m,n:j.
WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.secureMode then g.preload(function(r)if r<=0 then return
end local function s()if not p or p.unloaded then return end p:Notify{title=h.resolve'Secure mode',content=if r==1 then
h.resolve"An asset couldn't be cached and won't appear."else h.resolve"Some assets couldn't be cached and won't appear."
}end if p then s()else q=s end end)end local r,s=pcall(function()return(d(c.components.window)::WindowModule).new(n)end)
if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t if q then task.spawn(q)q=nil end if f.secureMode then
task.spawn(function()local u,v=f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.
fontAsset,Enum.FontWeight.SemiBold)if not t.unloaded and u and v and u~=f.fallbackFont and v~=f.fallbackFont then t:
ChangeTheme{Font=u,TitleFont=v}end end)end task.spawn(function()task.wait(0.5)o:Destroy()task.wait(0.5)if not t.unloaded
then t:Show()end end)return t end return k end)()end,[3]=function()local b,c,d=a(3)local e return(function(...)local f={
}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),d(g.HapticEngine)
function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)'),name=l.name or l.Name or'Action',icon=assert(l.icon or l.Icon,
'Missing argument (Icon expected)'),callback=assert(l.callback or l.Callback,'Missing argument (Function expected)'),
linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create('Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.
order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=m.window.actionContainer})m.iconLabel=m.window:
Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=m.action},{ImageColor3=
'ActionColor'})m.interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action}
)local function n()if not m.window:_settled()then return end if m.linkedTab and m.window.selectedTab==m.linkedTab then
return end if m.isLit and m:isLit()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end m.window:Connect(m.interact.MouseButton1Click,
function()j.click()task.spawn(function()local o,p=pcall(m.callback)if not o then i.warn(`Rayfield encountered an error, with the callback for a {
m.__type} component named '{m.name}':`)i.print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not
m.window:_interactive()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)m.window:
_applyActionSize()return m end return f end)()end,[4]=function()local b,c,d=a(4)local e return(function(...)local f={}f.
__index=f f.__type='Button'local g=c.Parent.Parent.utility local h,i,j,k,l,m=d(g.variables),d(g.functions),d(g.moveable)
,d(g.lockable),d(g.locale),d(g.HapticEngine)function f.new(n,o)o=if typeof(o)=='table'then o else{}local p=setmetatable(
{tab=assert(n,'Missing argument #1 (Tab expected)'),window=n.window,name=o.name or o.Name or'Button',icon=o.icon or o.
Icon,description=o.description or o.Description,compact=n.compact or false,callback=o.callback or o.Callback or function
()end},f)if p.compact then p:_buildCompact()else p:_buildFull()end if p.description and not p.compact then p.descriptor=
d(c.Parent.descriptor).new(p.tab,{description=p.description})end return p end function f._runCallback(n)n.window:
_runGuarded(n,n.callback)end function f._buildFull(n)n.main=n.window:Create('Frame',{Size=UDim2.new(1,-20,0,43),
BorderSizePixel=0,Name=n.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=n.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})n.stroke=n.window:StyleElementBody(n.main)n.hoverOverlay=n.window:
CreateHoverOverlay(n.main)n.container=n.window:Create('Frame',{BorderSizePixel=0,Parent=n.main,Size=UDim2.new(0,170,0,16
),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})n.containerLayout=n.window:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=n.container})if n.icon then n.
iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end n.title=n.window:
Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=
16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.interact=n.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=n.main})n.window:_wireElementHover(n)n.window:ConnectFor(n,n.
interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(n.main,TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,43)}):
Play()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n
.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(n)local o=n.window n.main,n.stroke,n.
interact=o:_buildCompactRow(n.tab,n.name)n.hoverOverlay=n.interact o:Create('UIPadding',{PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),Parent=n.interact})o:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,6
),Parent=n.interact})if n.icon then n.iconLabel=o:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=n.interact},{ImageColor3=
'ContentColor'})end n.title=o:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=n.interact},{TextColor3='ContentColor',
FontFace='Font'})o:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.window:_wireElementHover(n)n.
window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n.window.theme.
ElementStrokeTransparency}):Play()end)end function f._setShown(n,o,p)if o then n.window:_revealCommon(n,p)else n.window:
_hideCommon(n,p)end end function f._minWidth(n)local o=32 if n.icon then o+=22 end o+=i.textWidth(n.window.theme.Font,16
,l.resolve(n.name))return o end j(f)k(f)return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)
local f=c.Parent.Parent.utility local g,h,i,j,k,l,m,n=d(f.variables),d(f.pointer),d(f.filesystem),d(f.constants),d(f.
locale),d(f.HapticEngine),{},5 function m.buildCollapsedFace(o)local p=o.showIconOnly o.collapsedIcon=o:Create(
'ImageLabel',{Name='CollapsedIcon',AnchorPoint=if p then Vector2.new(0.5,0.5)else Vector2.new(0,0.5),Position=if p then
UDim2.fromScale(0.5,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image=o.
showIcon,ZIndex=j.zIndex.restoreContent,ImageTransparency=1,Parent=o.main},{ImageColor3='TitlingColor'})o:Create(
'UICorner',{Parent=o.collapsedIcon},{CornerRadius='PillCornerRadius'})local q=o:Create('Frame',{Name='CollapsedText',
Visible=not p,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),
BackgroundTransparency=1,ZIndex=j.zIndex.restoreContent,Parent=o.main})o:Create('UIListLayout',{Padding=UDim.new(0,1),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=q})o.collapsedTitle=o:
Create('TextLabel',{Name='Title',Text=o.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(
Enum.FontWeight.Medium),RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1
,ZIndex=j.zIndex.restoreContent,TextTransparency=1,Parent=q},{TextColor3='TitlingColor'})o.collapsedSubtitle=o:Create(
'TextLabel',{Name='Subtitle',Text=k.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.
brandFont(Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=j.zIndex.
restoreContent,TextTransparency=1,Parent=q},{TextColor3='TitlingColor'})o.collapsedInteract=o:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=j
.zIndex.restoreInteract,Parent=o.main})m.bindCollapsedDrag(o)end function m.bindCollapsedDrag(o)local p,q,r,s,t,u=g.
userInputService,false,false,Vector2.zero,(Vector2.zero)local function v()if o.screenGui and o.screenGui.IgnoreGuiInset
then return g.guiService:GetGuiInset()end return Vector2.zero end o:Connect(o.collapsedInteract.InputBegan,function(w,x)
if x or not o.hidden or o.animating then return end local y=w.UserInputType.Name if y~='MouseButton1'and y~='Touch'then
return end q,r=true,false u=w t=h.location(w)s=o.main.AbsolutePosition+o.main.AbsoluteSize*o.main.AnchorPoint-t end)o:
Connect(p.InputEnded,function(w)local x=w.UserInputType.Name if x~='MouseButton1'and x~='Touch'then return end if not q
then return end q=false if r then o._collapsedPosition=o.main.Position return end l.click()o:ToggleHide()end)o:Connect(p
.WindowFocusReleased,function()q=false end)o:Connect(g.runService.RenderStepped,function()if not q then return end if
not o.hidden or o.animating then q=false return end local w=h.location(u)if not r and(w-t).Magnitude<n then return end r
=true local x=w+s+v()local y,z=o:_fitCenter(x.X,x.Y,o.main.AbsoluteSize)o.main.Position=UDim2.fromOffset(y,z)end)end
function m.isNewUser()local o=g.localPlayer if not o then return false end if typeof(i.isfile)~='function'or typeof(i.
writefile)~='function'then return true end local p,q,r=g.fileSystemManager:getPath'lastuser.txt',tostring(o.UserId),true
pcall(function()if i.isfile(p)then r=i.readfile(p)~=q end end)pcall(function()i.writefile(p,q)end)return r end function
m.setCollapsedShown(o,p,q)local r={[o.collapsedIcon]={ImageTransparency=if p then 0 else 1}}if not o.showIconOnly then r
[o.collapsedTitle]={TextTransparency=if p then 0 else 1}r[o.collapsedSubtitle]={TextTransparency=if p then 0.5 else 1}
end for s,t in r do if q then g.tweenService:Create(s,q,t):Play()else for u,v in t do s[u]=v end end end end return m
end)()end,[6]=function()local b,c,d=a(6)local e return(function(...)local f={}f.__index=f f.__type='ColorPicker'local g=
c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A=d(g.variables),d(g.pointer),d(g.functions),d(g.
moveable),d(g.lockable),d(g.constants),d(g.locale),d(g.HapticEngine),ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3
.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.
fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(
255,0,0))},41,52,Vector2.new(150,120),184,10,214,10,240,62,8,400 local B,C,D,E,F,G,H,I={wide={height=190,previewPos=
UDim2.new(1,-20,0,r+39),previewSize=UDim2.new(1,-(x+20),0,78),hexPos=UDim2.new(0,x,0,r+90),hexSize=UDim2.new(1,-(x+20+y+
z),0,30),alphaFieldPos=UDim2.new(1,-(20+y),0,r+90),alphaFieldSize=UDim2.new(0,y,0,30)},narrow={height=296,previewPos=
UDim2.new(1,-20,0,r+s.Y+40),previewSize=UDim2.new(1,-40,0,56),hexPos=UDim2.new(0,20,0,r+s.Y+78),hexSize=UDim2.new(1,-(40
+y+z),0,30),alphaFieldPos=UDim2.new(1,-(20+y),0,r+s.Y+78),alphaFieldSize=UDim2.new(0,y,0,30)}},UDim2.new(1,-16,0,q/2),
UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo
.new(0.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out)local function J(K)return math.clamp(K,0,1)end local function K(L)return math.clamp(math.round(L),0,255)end local L
={black=Color3.fromRGB(0,0,0),white=Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0
),blue=Color3.fromRGB(0,0,255),yellow=Color3.fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(
255,0,255),orange=Color3.fromRGB(255,165,0),purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=
Color3.fromRGB(139,69,19),gray=Color3.fromRGB(128,128,128),grey=Color3.fromRGB(128,128,128)}local function M(N,O,P)if O
<=0 then return Color3.new(P,P,P)end local function Q(R,S,T)T=T%1 if T<0.16666666666666666 then return R+(S-R)*6*T
elseif T<0.5 then return S elseif T<0.6666666666666666 then return R+(S-R)*(0.6666666666666666-T)*6 end return R end
local R=if P<0.5 then P*(1+O)else P+O-P*O local S=2*P-R return Color3.new(Q(S,R,N+0.3333333333333333),Q(S,R,N),Q(S,R,N-
0.3333333333333333))end local function N(O)local P={}for Q in O:gmatch'[%d%.]+'do table.insert(P,tonumber(Q))end return
P end local function O(P)if typeof(P)~='string'then return nil end local Q=(P:lower():match'^%s*(.-)%s*$')or''if Q==''
then return nil end if L[Q]then return L[Q]end local R,S=Q:match'^(%a+)',N(Q)if(R=='hsv'or R=='hsb')and#S>=3 then local
T,U,V=(S[1]%360)/360,if S[2]>1 then S[2]/100 else S[2],if S[3]>1 then S[3]/100 else S[3]return Color3.fromHSV(T,J(U),J(V
))end if R=='hsl'and#S>=3 then local T,U,V=(S[1]%360)/360,if S[2]>1 then S[2]/100 else S[2],if S[3]>1 then S[3]/100 else
S[3]return M(T,J(U),J(V))end if(R=='rgb'or R=='rgba')and#S>=3 then return Color3.fromRGB(K(S[1]),K(S[2]),K(S[3]))end
local T=Q:match'^#?(%x%x%x%x%x%x)$'or Q:match'^#?(%x%x%x)$'or Q:match'^0x(%x%x%x%x%x%x)$'if T then local U,V=pcall(
Color3.fromHex,T)if U then return V end end if#S>=3 and not R then if S[1]<=1 and S[2]<=1 and S[3]<=1 then return Color3
.new(J(S[1]),J(S[2]),J(S[3]))end return Color3.fromRGB(K(S[1]),K(S[2]),K(S[3]))end return nil end local function P(Q,R)
if typeof(Q)=='Color3'then return Q end if typeof(Q)=='string'then return O(Q)or R end return R end function f.new(Q,R)R
=if typeof(R)=='table'then R else{}local S=setmetatable({tab=assert(Q,'Missing argument #1 (Tab expected)'),window=Q.
window,name=R.name or R.Name or'Color Picker',icon=R.icon or R.Icon,description=R.description or R.Description,
forgetState=R.forgetState or R.ForgetState or Q.forgetState,callback=R.callback or R.Callback or function()end,_isOpen=
false},f)S.value=P(R.color or R.Color or R.value or R.Value or R.default,Color3.fromRGB(255,255,255))S.hue,S.sat,S.val=S
.value:ToHSV()local T=R.alpha or R.Alpha S.alpha=if type(T)=='number'then J(T)else 1 S.flag=R.flag or R.Flag or(not S.
forgetState and j.deriveFlagFromName(S.name)or nil)S.window:_registerControl(S)S.main=S.window:Create('Frame',{Size=
UDim2.new(1,-20,0,q),BorderSizePixel=0,Name=S.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1
,Parent=S.tab.tabPage},{BackgroundTransparency='ElementTransparency'})S.stroke=S.window:StyleElementBody(S.main)S.
hoverOverlay=S.window:CreateHoverOverlay(S.main)S:_buildHeader()S:_buildPicker()S.window:ConnectFor(S,S.interact.
MouseButton1Click,function()o.click()if S._isOpen then S:_close()else S:_open()end end)S.window:ConnectFor(S,S.main.
MouseEnter,function()if S._isOpen or not S.window:_interactive()then return end local U=S.window.theme h.tweenService:
Create(S.stroke,F,{Transparency=U.ElementStrokeHoverTransparency,Color=U.ElementStrokeHover}):Play()h.tweenService:
Create(S.title,F,{TextColor3=U.ElementTextHoverColor}):Play()h.tweenService:Create(S.hoverOverlay,F,{
BackgroundTransparency=0.97}):Play()end)S.window:ConnectFor(S,S.main.MouseLeave,function()local U=S.window.theme h.
tweenService:Create(S.stroke,F,{Transparency=U.ElementStrokeTransparency,Color=U.ElementStroke}):Play()h.tweenService:
Create(S.title,F,{TextColor3=U.ContentColor}):Play()h.tweenService:Create(S.hoverOverlay,F,{BackgroundTransparency=1}):
Play()end)if S.description then S.descriptor=d(c.Parent.descriptor).new(S.tab,{description=S.description})end S:
_applyPickerVisibility(false,false)S:_setControlsVisible(false)S.window:ConnectFor(S,S.main:GetPropertyChangedSignal
'AbsoluteSize',function()if S.window.animating or(S.window.hidden and S.window.hasShownOnce)then return end S:
_applyLayout()end)S:_applyLayout()S:_render'instant'return S end function f._buildHeader(Q)Q.container=Q.window:Create(
'Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0,q/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,BorderSizePixel=0,ZIndex=5,Parent=Q.main})Q.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.
container})if Q.icon then Q.iconLabel=Q.window:Create('ImageLabel',{Image=Q.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=Q.container},{ImageColor3='ContentColor'}
)end Q.title=Q.window:Create('TextLabel',{Text=n.t(Q.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=Q.container},{TextColor3='ContentColor',FontFace='Font'})Q.preview=Q.
window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=C,Size=D,BackgroundColor3=Q.value,BorderSizePixel=0,
ZIndex=3,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.preview
})Q.previewShadow=Q.window:CreateGlow(Q.preview,Q.value,20,1)Q.invisibleGroup=Q.window:Create('Frame',{Size=UDim2.
fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=Q.preview})Q.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal
,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,
6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=Q.invisibleGroup})Q.invisibleIcon=Q.window:Create('ImageLabel',{Image=m.
icons.colorpicker,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,
Parent=Q.invisibleGroup},{ImageColor3='ContentColor'})Q.invisibleText=Q.window:Create('TextLabel',{Text=n.t'Invisible',
Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=Q.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})Q.
interact=Q.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,q),Position=UDim2.fromScale(0,0),
BorderSizePixel=0,Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=Q.main})end function f._buildMap(Q)Q
.map=Q.window:Create('Frame',{Position=UDim2.fromOffset(20,r),Size=UDim2.fromOffset(s.X,s.Y),BackgroundColor3=Color3.
fromHSV(Q.hue,1,1),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=Q.map})Q.mapStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Transparency=1,Parent=Q.map})Q.satOverlay=Q.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{
CornerRadius=UDim.new(0,8),Parent=Q.satOverlay})Q.window:Create('UIGradient',{Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=Q.satOverlay})Q.valOverlay=Q.window:Create(
'Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,
BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.valOverlay})Q.
window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)},Parent=Q.valOverlay})end function f._buildPicker(Q)Q:_buildMap()Q.satCursor=Q.window:
Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1,Parent=Q.map})Q.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=Q.satCursor})Q.satCursorStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2
,Transparency=1,Parent=Q.satCursor})Q.mapInteract=Q.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=7,Parent=Q.map})Q.hueBar=Q.window:Create('Frame',
{Position=UDim2.fromOffset(t,r),Size=UDim2.fromOffset(u,s.Y),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(1,0
),Parent=Q.hueBar})Q.window:Create('UIGradient',{Color=p,Rotation=90,Parent=Q.hueBar})Q.hueHandle=Q.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(u+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=Q.hueBar})Q.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=Q.hueHandle})Q.hueHandleStroke=Q.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=Q.hueHandle})Q.hueInteract=Q.window:Create('TextButton',{
BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=Q.hueBar})Q.alphaBar=Q.window:Create('Frame',{Position=
UDim2.fromOffset(v,r),Size=UDim2.fromOffset(w,s.Y),BackgroundColor3=Q.value,BorderSizePixel=0,ZIndex=2,
BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=Q.alphaBar})Q.
alphaGradient=Q.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=Q.alphaBar})Q.alphaHandle=Q.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(w+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=Q.alphaBar})Q.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=Q.alphaHandle})Q.alphaHandleStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=2,Transparency=1,Parent=Q.alphaHandle})Q.alphaInteract=Q.window:Create('TextButton',{BackgroundTransparency=1,
Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=6,Parent=Q.alphaBar})Q.hexBox=Q.window:Create('Frame',{Position=UDim2.new(0,x,0,r+90),Size=
UDim2.new(1,-(x+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.hexBox})Q.hexBoxStroke=Q.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=Q.hexBox})Q.hexInput=Q.window:Create(
'TextBox',{Text='#'..Q.value:ToHex():upper(),PlaceholderText=n.t'Smart Input',Size=UDim2.new(1,-14,1,0),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency=1,Parent=Q.hexBox},{
TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})Q.alphaBox=Q.window:Create('Frame',{
Position=UDim2.new(0,x,0,r+90),Size=UDim2.fromOffset(y,30),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=
0,ZIndex=2,BackgroundTransparency=1,Parent=Q.main})Q.window:Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=Q.
alphaBox})Q.alphaBoxStroke=Q.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=Q.
alphaBox})Q.alphaInput=Q.window:Create('TextBox',{Text=tostring(math.round(Q.alpha*100))..'%',PlaceholderText='100%',
Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=Q.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})Q.window:
ConnectFor(Q,Q.mapInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 or R.UserInputType
==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('sat',R.UserInputType==Enum.UserInputType.MouseButton1)end
end)Q.window:ConnectFor(Q,Q.hueInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 or R.
UserInputType==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('hue',R.UserInputType==Enum.UserInputType.
MouseButton1)end end)Q.window:ConnectFor(Q,Q.alphaInteract.InputBegan,function(R)if R.UserInputType==Enum.UserInputType.
MouseButton1 or R.UserInputType==Enum.UserInputType.Touch then Q._dragInput=R Q:_beginDrag('alpha',R.UserInputType==Enum
.UserInputType.MouseButton1)end end)Q.window:ConnectFor(Q,h.userInputService.InputEnded,function(R)if(R.UserInputType==
Enum.UserInputType.MouseButton1 or R.UserInputType==Enum.UserInputType.Touch)and Q._drag then Q:_endDrag()end end)Q.
window:ConnectFor(Q,Q.hexInput.FocusLost,function()local R=O(Q.hexInput.Text)if R then Q:Set(R)else Q.hexInput.Text='#'
..Q.value:ToHex():upper()end end)Q.window:ConnectFor(Q,Q.alphaInput.FocusLost,function()local R=tonumber((Q.alphaInput.
Text:gsub('[^%d%.]','')))if R then Q:SetAlpha(J(R/100))else Q.alphaInput.Text=tostring(math.round(Q.alpha*100))..'%'end
end)end function f._beginDrag(Q,R,S)if not Q._isOpen then return end Q._drag=R Q._dragIsMouse=S Q:_setHeld(R)Q:_pump()if
Q._dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end Q._dragConnection=h.runService.
RenderStepped:Connect(function()local T=Q._dragIsMouse and not h.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if Q.window.unloaded or not Q._drag or T then if T then Q:_endDrag()return end if Q.
_dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end return end Q:_pump()end)end function f.
_endDrag(Q)Q._drag=nil Q:_setHeld(nil)if Q._dragConnection then Q._dragConnection:Disconnect()Q._dragConnection=nil end
Q.window:_persist(Q)end function f._setHeld(Q,R)local S,T,U=if R=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if R=='hue'then UDim2.fromOffset(u+12,10)else UDim2.fromOffset(u+8,8),if R=='alpha'then UDim2.
fromOffset(w+12,10)else UDim2.fromOffset(w+8,8)h.tweenService:Create(Q.satCursor,I,{Size=S}):Play()h.tweenService:
Create(Q.hueHandle,I,{Size=T}):Play()h.tweenService:Create(Q.alphaHandle,I,{Size=U}):Play()end function f._mouseLocation
(Q)local R,S=i.location(Q._dragInput),Q.window.screenGui if S and S.IgnoreGuiInset then return R-h.guiService:
GetGuiInset()end return R end function f._pump(Q)local R,S,T,U=Q.hue,Q.sat,Q.val,Q.alpha if Q._drag=='sat'then local V=Q
.map.AbsoluteSize if V.X<=0 or V.Y<=0 then return end local W=Q:_mouseLocation()Q.sat=J((W.X-Q.map.AbsolutePosition.X)/V
.X)Q.val=1-J((W.Y-Q.map.AbsolutePosition.Y)/V.Y)elseif Q._drag=='hue'then local V=Q.hueBar.AbsoluteSize.Y if V<=0 then
return end local W=Q:_mouseLocation()Q.hue=J((W.Y-Q.hueBar.AbsolutePosition.Y)/V)elseif Q._drag=='alpha'then local V=Q.
alphaBar.AbsoluteSize.Y if V<=0 then return end local W=Q:_mouseLocation()Q.alpha=1-J((W.Y-Q.alphaBar.AbsolutePosition.Y
)/V)else return end if Q.hue==R and Q.sat==S and Q.val==T and Q.alpha==U then return end Q.value=Color3.fromHSV(Q.hue,Q.
sat,Q.val)Q:_render'drag'Q:_fireCallback()end function f._render(Q,R)local S,T,U,V,W,X=Color3.fromHSV(Q.hue,1,1),UDim2.
new(Q.sat,0,1-Q.val,0),UDim2.new(0.5,0,Q.hue,0),UDim2.new(0.5,0,1-Q.alpha,0),1-Q.alpha,1-0.4*Q.alpha if R=='instant'then
Q.map.BackgroundColor3=S Q.satCursor.Position,Q.satCursor.BackgroundColor3=T,Q.value Q.hueHandle.Position,Q.hueHandle.
BackgroundColor3=U,S Q.alphaBar.BackgroundColor3=Q.value Q.alphaHandle.Position,Q.alphaHandle.BackgroundColor3=V,Q.value
Q.preview.BackgroundColor3=Q.value Q.previewShadow.Color=Q.value if not Q.window.hidden then Q.preview.
BackgroundTransparency=W Q.previewShadow.Transparency=X end else local Y=if R=='drag'then H else G h.tweenService:
Create(Q.map,Y,{BackgroundColor3=S}):Play()h.tweenService:Create(Q.satCursor,Y,{Position=T,BackgroundColor3=Q.value}):
Play()h.tweenService:Create(Q.hueHandle,Y,{Position=U,BackgroundColor3=S}):Play()h.tweenService:Create(Q.alphaHandle,Y,{
Position=V,BackgroundColor3=Q.value}):Play()h.tweenService:Create(Q.alphaBar,G,{BackgroundColor3=Q.value}):Play()local Z
,_={BackgroundColor3=Q.value},{Color=Q.value}if not Q.window.hidden then Z.BackgroundTransparency=W _.Transparency=X end
h.tweenService:Create(Q.preview,G,Z):Play()h.tweenService:Create(Q.previewShadow,G,_):Play()end if not Q.hexInput:
IsFocused()then Q.hexInput.Text='#'..Q.value:ToHex():upper()end if not Q.alphaInput:IsFocused()then Q.alphaInput.Text=
tostring(math.round(Q.alpha*100))..'%'end Q:_renderInvisible(R~='instant')end function f._renderInvisible(Q,R)local S=0
if Q._isOpen and not Q.window.hidden then S=J((0.12-Q.alpha)/0.12)end local T=1-S if R then h.tweenService:Create(Q.
invisibleIcon,F,{ImageTransparency=T}):Play()h.tweenService:Create(Q.invisibleText,F,{TextTransparency=T}):Play()else Q.
invisibleIcon.ImageTransparency=T Q.invisibleText.TextTransparency=T end end function f._fireCallback(Q)Q.window:
_runGuarded(Q,Q.callback,Q.value,Q.alpha)end function f._open(Q)if Q._isOpen then return end Q._isOpen=true Q:
_setControlsVisible(true)if Q._outsideClickConn then Q.window:Disconnect(Q._outsideClickConn)end Q._outsideClickConn=Q.
window:Connect(h.userInputService.InputBegan,function(R)if R.UserInputType~=Enum.UserInputType.MouseButton1 and R.
UserInputType~=Enum.UserInputType.Touch then return end local S,T,U=R.Position,Q.main.AbsolutePosition,Q.main.
AbsoluteSize if S.X<T.X or S.X>T.X+U.X or S.Y<T.Y or S.Y>T.Y+U.Y then Q:_close()end end)h.tweenService:Create(Q.main,E,{
Size=UDim2.new(1,-20,0,Q._openHeight)}):Play()h.tweenService:Create(Q.preview,E,{Position=Q._previewOpenPos,Size=Q.
_previewOpenSize}):Play()Q:_applyPickerVisibility(true,true)Q:_renderInvisible(true)end function f._close(Q)if not Q.
_isOpen then return end Q._isOpen=false if Q._outsideClickConn then Q.window:Disconnect(Q._outsideClickConn)Q.
_outsideClickConn=nil end if Q._drag then Q:_endDrag()end if Q.hexInput:IsFocused()then Q.hexInput:ReleaseFocus()end if
Q.alphaInput:IsFocused()then Q.alphaInput:ReleaseFocus()end Q:_applyPickerVisibility(false,true)Q:_renderInvisible(true)
h.tweenService:Create(Q.preview,E,{Position=C,Size=D}):Play()h.tweenService:Create(Q.main,E,{Size=UDim2.new(1,-20,0,q)})
:Play()task.delay(F.Time,function()if not Q._isOpen then Q:_setControlsVisible(false)end end)end function f.
_applyPickerVisibility(Q,R,S)local T={[Q.map]={BackgroundTransparency=if R then 0 else 1},[Q.satOverlay]={
BackgroundTransparency=if R then 0 else 1},[Q.valOverlay]={BackgroundTransparency=if R then 0 else 1},[Q.mapStroke]={
Transparency=if R then 0.9 else 1},[Q.satCursor]={BackgroundTransparency=if R then 0 else 1},[Q.satCursorStroke]={
Transparency=if R then 0 else 1},[Q.hueBar]={BackgroundTransparency=if R then 0 else 1},[Q.hueHandle]={
BackgroundTransparency=if R then 0 else 1},[Q.hueHandleStroke]={Transparency=if R then 0 else 1},[Q.alphaBar]={
BackgroundTransparency=if R then 0 else 1},[Q.alphaHandle]={BackgroundTransparency=if R then 0 else 1},[Q.
alphaHandleStroke]={Transparency=if R then 0 else 1},[Q.hexBox]={BackgroundTransparency=if R then 0.9 else 1},[Q.
hexBoxStroke]={Transparency=if R then 0.85 else 1},[Q.hexInput]={TextTransparency=if R then 0.4 else 1},[Q.alphaBox]={
BackgroundTransparency=if R then 0.9 else 1},[Q.alphaBoxStroke]={Transparency=if R then 0.85 else 1},[Q.alphaInput]={
TextTransparency=if R then 0.4 else 1}}for U,V in T do if S then h.tweenService:Create(U,F,V):Play()else for W,X in V do
U[W]=X end end end end function f._setControlsVisible(Q,R)for S,T in{Q.map,Q.hueBar,Q.alphaBar,Q.hexBox,Q.alphaBox}do T.
Visible=R end end function f._applyLayout(Q)local R=Q.main.AbsoluteSize.X/Q.window.scale local S=if R>0 and R<A then
'narrow'else'wide'if S==Q._layoutMode then return end Q._layoutMode=S local T=B[S]Q._openHeight=T.height Q.
_previewOpenPos=T.previewPos Q._previewOpenSize=T.previewSize Q.hexBox.Position=T.hexPos Q.hexBox.Size=T.hexSize Q.
alphaBox.Position=T.alphaFieldPos Q.alphaBox.Size=T.alphaFieldSize if Q._isOpen then h.tweenService:Create(Q.main,E,{
Size=UDim2.new(1,-20,0,Q._openHeight)}):Play()h.tweenService:Create(Q.preview,E,{Position=Q._previewOpenPos,Size=Q.
_previewOpenSize}):Play()end end function f.Set(Q,R,S)Q.value=P(R,Q.value)Q.hue,Q.sat,Q.val=Q.value:ToHSV()Q:_render(if
Q._isOpen then'animate'else'instant')if not S then Q:_fireCallback()Q.window:_persist(Q)end end function f.SetAlpha(Q,R,
S)Q.alpha=J(if type(R)=='number'then R else Q.alpha)Q:_render(if Q._isOpen then'animate'else'instant')if not S then Q:
_fireCallback()Q.window:_persist(Q)end end function f._serialize(Q)return Q.value:ToHex()..string.format('%02x',math.
clamp(math.round((Q.alpha or 1)*255),0,255))end function f._deserialize(Q,R)local S,T=(tostring(R))if#S>=8 then T=(
tonumber(S:sub(7,8),16)or 255)/255 S=S:sub(1,6)end local U,V=pcall(Color3.fromHex,S)if not U then return end if T then Q
:SetAlpha(T,true)end Q:Set(V)end function f._setShown(Q,R,S)local T=Q.window if R then T:_revealCommon(Q,S)T:_reveal(Q.
preview,{BackgroundTransparency=1-Q.alpha},S)T:_reveal(Q.previewShadow,{Transparency=1-0.4*Q.alpha},S)else T:
_hideCommon(Q,S)T:_reveal(Q.preview,{BackgroundTransparency=1},S)T:_reveal(Q.previewShadow,{Transparency=1},S)if Q.
_isOpen then Q:_close()end end end k(f)l(f)return f end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)
local f={}f.__index=f f.__type='Console'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r=d(g.moveable),d(g.
locale),120,48,24,17,12,12,1.25,200,Font.fromEnum(Enum.Font.Code)function f.new(s,t)t=if typeof(t)=='table'then t else{}
local u=setmetatable({tab=assert(s,'Missing argument #1 (Tab expected)'),window=s.window,name=t.name or t.Name,
description=t.description or t.Description,height=math.max(tonumber(t.height or t.Height)or j,k),follow=t.follow or t.
Follow or false,maxLines=math.max(tonumber(t.maxLines or t.MaxLines)or q,1),lines={},lineLabels={},head=1,nextOrder=1,
textDirty=true},f)u:_build()u:_setLines(t.text or t.Text or'')if u.description then u.descriptor=d(c.Parent.descriptor).
new(u.tab,{description=u.description})end return u end function f.Get(s):string if s.textDirty then s.text=table.concat(
s.lines,'\n')s.textDirty=false end return s.text end function f._setLines(s,t)t=if type(t)=='string'then t else
tostring(t)table.clear(s.lines)if t~=''then for u in string.gmatch(t..'\n','([^\n]*)\n')do table.insert(s.lines,u)end
end s:_trim()s:_flush()end function f._trim(s)local t=#s.lines-s.maxLines if t<=0 then return end table.move(s.lines,t+1
,#s.lines,1)for u=#s.lines,#s.lines-t+1,-1 do s.lines[u]=nil end end function f._makeLabel(s)return s.window:Create(
'TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
FontFace=r,TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,
LineHeight=p,RichText=false,TextTransparency=s._textTransparency or 1,Parent=s.scroll},{TextColor3='ContentColor'})end
local function s(t:string):string return if t==''then' 'else t end function f._flush(t)t.textDirty=true for u,v in t.
lines do local w=t.lineLabels[u]if not w then w=t:_makeLabel()t.lineLabels[u]=w end w.LayoutOrder=u w.Text=s(v)w.Visible
=true end for u=#t.lines+1,#t.lineLabels do t.lineLabels[u].Visible=false end t.head=1 t.nextOrder=#t.lines+1 t:_follow(
)end function f._pushLine(t,u:string)t.textDirty=true if#t.lines<t.maxLines then table.insert(t.lines,u)local v=#t.lines
local w=t.lineLabels[v]if not w then w=t:_makeLabel()t.lineLabels[v]=w end w.LayoutOrder=t.nextOrder w.Text=s(u)w.
Visible=true t.nextOrder+=1 return end table.move(t.lines,2,#t.lines,1)t.lines[#t.lines]=u local v=t.lineLabels[t.head]v
.LayoutOrder=t.nextOrder v.Text=s(u)v.Visible=true t.nextOrder+=1 t.head=(t.head%#t.lineLabels)+1 end function f._build(
t)local u=if t.name then l else 0 t.main=t.window:Create('Frame',{Size=UDim2.new(1,-20,0,t.height+u+m*2),BorderSizePixel
=0,Name=t.name or'Console',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=t.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})t.stroke=t.window:StyleElementBody(t.main)if t.name then t.container=t.
window:Create('Frame',{Size=UDim2.new(1,-m*2,0,16),Position=UDim2.new(0,m,0,m),BackgroundTransparency=1,BorderSizePixel=
0,Parent=t.main})t.title=t.window:Create('TextLabel',{Text=i.t(t.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=t.container},{
TextColor3='ContentColor',FontFace='Font'})end t.panel=t.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=
UDim2.new(0.5,0,1,-m),Size=UDim2.new(1,-m*2,0,t.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1
,Parent=t.main},{BackgroundColor3='StatBackground'})t.window:Create('UICorner',{Parent=t.panel},{CornerRadius=
'ElementCornerRadius'})t.panelStroke=t.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=1,Parent=t.panel},{Color='SurfaceStroke'})t.scroll=t.window:Create('ScrollingFrame',{Size=UDim2.new(1,-n*2,
1,-n*2),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,Parent=t.panel})t.scrollLayout=t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=t.scroll})t:_watchCanvas()end function f._pin(t)local u=t.scroll if not u or not u.Parent
then return end u.CanvasPosition=Vector2.new(0,u.AbsoluteCanvasSize.Y)end function f._follow(t)if not t.follow then
return end t:_pin()task.defer(function()t:_pin()end)end function f._watchCanvas(t)t.window:ConnectFor(t,t.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if t.follow then t:_pin()end end)end function f.Set(t,u)t:
_setLines(u)end function f.Append(t,u)u=if type(u)=='string'then u else tostring(u)for v in string.gmatch(u..'\n',
'([^\n]*)\n')do t:_pushLine(v)end t:_follow()end function f.Clear(t)table.clear(t.lines)t:_flush()end function f.Copy(t)
:boolean local u=(getgenv and getgenv().setclipboard)or setclipboard if typeof(u)~='function'then return false end
return(pcall(u,t:Get()))end function f.SetHeight(t,u)t.height=math.max(tonumber(u)or j,k)local v=if t.name then l else 0
t.panel.Size=UDim2.new(1,-m*2,0,t.height)t.main.Size=UDim2.new(1,-20,0,t.height+v+m*2)end function f._setShown(t,u,v)
local w=t.window w:_reveal(t.main,{BackgroundTransparency=if u then w.theme.ElementTransparency or 0 else 1},v)w:
_reveal(t.stroke,{Transparency=if u then w.theme.ElementStrokeTransparency else 1},v)w:_reveal(t.panel,{
BackgroundTransparency=if u then 0 else 1},v)w:_reveal(t.panelStroke,{Transparency=if u then 0.9 else 1},v)t.
_textTransparency=if u then 0.15 else 1 for x,y in t.lineLabels do w:_reveal(y,{TextTransparency=t._textTransparency},v)
end if t.title then w:_reveal(t.title,{TextTransparency=if u then 0 else 1},v)end if t.descriptor then w:_reveal(t.
descriptor.titleLabel,{TextTransparency=if u then 0.7 else 1},v)end end function f.Remove(t)if t.descriptor then t.
descriptor:Remove()end t.main:Destroy()end h(f)return f end)()end,[8]=function()local b,c,d=a(8)local e return(function(
...)local f={}f.__index=f f.__type='Descriptor'local g=d(c.Parent.Parent.utility.locale)function f.new(h,i)i=if typeof(i
)=='table'then i else{}local j=setmetatable({tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.window,
description=i.description or i.Description or''},f)j.main=j.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=j.tab.tabPage})j.window:Create('UIListLayout',{SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.main})j.titleLabel=j.window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-90,0,0),Text=g.t(j.description),TextSize=12,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=j.main},{TextColor3='ContentColor',FontFace='Font'})j.
window:Create('Frame',{BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=j.
main})return j end return f end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f={}f.__index=f f.
__type='Divider'local g,h,i,j,k,l,m,n,o=d(c.Parent.Parent.utility.moveable),d(c.Parent.Parent.utility.locale),1,12,10,14
,12,0.88,0.55 function f.new(p,q)q=if typeof(q)=='table'then q else{}local r,s=q.spacing or q.Spacing,q.text or q.Text
local t=setmetatable({tab=assert(p,'Missing argument #1 (Tab expected)'),window=p.window,text=if s~=nil then tostring(s)
else'',spacing=if type(r)=='number'then math.max(r,0)else j,line=q.line~=false and q.Line~=false},f)t.main=t.window:
Create('Frame',{Size=UDim2.new(1,-40,0,0),BorderSizePixel=0,Name='Divider',BackgroundTransparency=1,Parent=t.tab.tabPage
})t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,k),SortOrder=Enum.
SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=t.main})if t.line then t.left=t:_buildHalf(1)end if t.text~=''then t:_buildLabel()end t:_applyHeight()
return t end function f._buildHalf(p,q)local r=p.window:Create('Frame',{Size=UDim2.new(0,0,0,i),BorderSizePixel=0,
LayoutOrder=q,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3='ContentColor'})p.window:Create('UIFlexItem',{
FlexMode=Enum.UIFlexMode.Fill,Parent=r})return r end function f._buildLabel(p)p.title=p.window:Create('TextLabel',{Text=
h.t(p.text),Size=UDim2.fromOffset(0,l),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=m,TextXAlignment=Enum.TextXAlignment.Center,LayoutOrder=2,TextTransparency=1,Parent=p.main},{TextColor3=
'ContentColor',FontFace='Font'})if p.line then p.right=p:_buildHalf(3)end end function f._applyHeight(p)local q=if p.
text~=''then l elseif p.line then i else 0 p.main.Size=UDim2.new(1,-40,0,p.spacing*2+q)end function f.Set(p,q)p.text=if
q~=nil then tostring(q)else''if p.text~=''and not p.title then p:_buildLabel()if not p.window.hidden then p:_setShown(
true,true)end end if p.title then p.window:_bindLocale(p.title,'Text',p.text)local r=p.text~=''p.title.Visible=r if p.
right then p.right.Visible=r end end p:_applyHeight()end function f._setShown(p,q,r)local s,t=p.window,if q then n else
1 s:_reveal(p.left,{BackgroundTransparency=t},r)s:_reveal(p.right,{BackgroundTransparency=t},r)s:_reveal(p.title,{
TextTransparency=if q then o else 1},r)end g(f)return f end)()end,[10]=function()local b,c,d=a(10)local e return(
function(...)local f={}f.__index=f f.__type='Drag'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.pointer
),d(g.constants)function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)')},f)m.drag=m.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,m.window.size.Y.Offset*m.window.scale/2
+15),ZIndex=j.zIndex.drag,Visible=false,Parent=m.window.screenGui})m.dragCosmetic=m.window:Create('Frame',{
BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=j
.zIndex.drag,BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=m.drag})m.window:Create('UICorner',{CornerRadius
=UDim.new(0,20),Parent=m.dragCosmetic})m.window:CreateGlow(m.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)m.
dragInteract=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=
j.zIndex.drag,Parent=m.drag})local n,o,p,q,r=false,Vector2.zero,(m.window.screenGui)if p and p.IgnoreGuiInset then o=h.
guiService:GetGuiInset()end local function s()local t,u,v=if h.userInputService then i.location(r)else Vector2.new(0,0),
q or Vector2.new(0,0),o or Vector2.new(0,0)return t+u+v end local function t()local u=s()local v,w=u.X,u.Y v,w=m.window:
_fitCenter(v,w,m.window.main.AbsoluteSize)local x,y=UDim2.fromOffset(v,w),UDim2.fromOffset(v,w+(m.window.main.Size.Y.
Offset*m.window.scale/2+15))return x,y end m.window:Connect(m.drag.MouseEnter,function()if not n and not m.window.hidden
then h.tweenService:Create(m.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)m.window:Connect(m.drag.MouseLeave,function()if not
n and not m.window.hidden then h.tweenService:Create(m.dragCosmetic,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.
EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)}):Play()end end)local function u()if not n
then return end n=false if not m.window:_interactive()then return end h.tweenService:Create(m.dragCosmetic,TweenInfo.
new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,100,0,4),BackgroundTransparency=0.7}):Play()
local v,w,x=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),t()h.tweenService:Create(m.window.main,v,
{Position=w}):Play()h.tweenService:Create(m.drag,v,{Position=x}):Play()end m.window:Connect(m.dragInteract.InputBegan,
function(v,w)if w then return end local x=v.UserInputType.Name if x=='MouseButton1'or x=='Touch'then if not m.window:
_interactive()then return end n=true r=v if p and p.IgnoreGuiInset then o=h.guiService:GetGuiInset()end q=m.window.main.
AbsolutePosition+m.window.main.AbsoluteSize*m.window.main.AnchorPoint-i.location(v)if not m.window.hidden then h.
tweenService:Create(m.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,
110,0,4),BackgroundTransparency=0}):Play()end end end)m.window:Connect(h.userInputService.InputEnded,function(v)local w=
v.UserInputType.Name if w=='MouseButton1'or w=='Touch'then u()end end)m.window:Connect(h.userInputService.
WindowFocusReleased,u)local v,w=1e-7,1e-60 m.window:Connect(h.runService.RenderStepped,function(x)if not n then return
end if not m.window:_interactive()then u()return end local y,z=t()m.window.main.Position=m.window.main.Position:Lerp(y,1
-v^x)m.drag.Position=m.drag.Position:Lerp(z,1-w^x)end)return m end return f end)()end,[11]=function()local b,c,d=a(11)
local e return(function(...)local f={}f.__index=f f.__type='Dropdown'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n
,o=d(g.variables),d(g.functions),d(g.image),d(g.constants),d(g.locale),d(g.HapticEngine),d(g.windowSizing),d(g.lockable)
local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D=k.icons.chevron,k.icons.check,k.icons.dot,k.icons.search,UDim.new(0,12),UDim.new(0,7
),30,38,38,5,2,41,6,7,6 local E,F,G,H,I,J,K=C+D,4,22,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.4,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out)local function L(M)local N,O={},{}for P,Q in M do if typeof(Q)=='string'and not N[Q]then N[Q]=
true table.insert(O,Q)end end return O end local function M(N,O)if N==nil then return{}end if typeof(N)=='string'then
return{N}end if typeof(N)=='table'then local P=L(N)if not O and#P>1 then return{P[1]}end return P end return{}end
local function N(O,P)local Q={}for R,S in O do if table.find(P,S)then table.insert(Q,S)end end return Q end
local function O(P,Q)if#P~=#Q then return false end for R,S in P do if not table.find(Q,S)then return false end end
return true end function f.new(P,Q)Q=if typeof(Q)=='table'then Q else{}local R,S=Q.options or Q.Options or{},Q.
multiSelect or Q.MultiSelect or Q.MultipleOptions or false local T=setmetatable({tab=assert(P,
'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or'Dropdown',icon=Q.icon or Q.Icon,
description=Q.description or Q.Description,forgetState=Q.forgetState or Q.ForgetState or P.forgetState,flag=Q.flag or Q.
Flag or(not(Q.forgetState or Q.ForgetState or P.forgetState)and i.deriveFlagFromName(Q.name or Q.Name or'Dropdown')or
nil),callback=Q.callback or Q.Callback or function()end,options=L(R),multiSelect=S,placeholderText=l.resolve(Q.
placeholder or Q.Placeholder or'None'),value=M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption,S),_isOpen=false
,_optionFrames={}},f)T._desiredValue=T.value T.value=N(T.value,T.options)T.window:_registerControl(T)T.main=T.window:
Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=T.name,BackgroundTransparency=1,Parent=T.tab.tabPage})
T.top=T.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,BackgroundColor3
=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=T.main},{BackgroundTransparency=
'ElementTransparency'})T.stroke=T.window:StyleElementBody(T.top)T.hoverOverlay=T.window:CreateHoverOverlay(T.top)T.
flashTarget=T.top T.container=T.window:Create('Frame',{BorderSizePixel=0,Parent=T.top,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})T.containerLayout=T.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=T.container})if T.icon then T.
iconLabel=T.window:Create('ImageLabel',{Image=T.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=T.container},{ImageColor3='ContentColor'})end T.title=T.
window:Create('TextLabel',{Text=l.t(T.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=T.container},{TextColor3='ContentColor',FontFace='Font'})T.selectedLabel=T.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.fromOffset(168,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextWrapped=true,
TextTransparency=1,ZIndex=5,Parent=T.top},{TextColor3='ContentColor',FontFace='Font'})T.chevron=T.window:Create(
'ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,Image='rbxassetid://'..tostring(p),Rotation=180,ImageTransparency=1,ZIndex=5,
Parent=T.top},{ImageColor3='ContentColor'})T.interact=T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false
,Parent=T.main})T.panel=T.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.
new(1,0,1,-(A+B)),BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,
BackgroundTransparency=1,Parent=T.main})T.panelStroke=T.window:StyleElementPanel(T.panel)T.window:Create('UIListLayout',
{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=T.panel})T.window:
Create('UIPadding',{PaddingTop=UDim.new(0,C),PaddingBottom=UDim.new(0,D),Parent=T.panel})T:_buildSearch()T:
_buildActions()T.list=T.window:Create('ScrollingFrame',{Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,
BackgroundTransparency=1,ClipsDescendants=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),
ScrollBarImageColor3=Color3.fromRGB(240,240,240),ScrollBarThickness=3,ScrollBarImageTransparency=1,ScrollingDirection=
Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,Parent=T.panel})T.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=T.list})T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'CanvasPosition',function()T:_syncScrollHint()
end)T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteCanvasSize',function()T:_syncScrollHint()end)T.window:
ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteWindowSize',function()T:_syncScrollHint()end)T.listLayout=T.window:
Create('UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Parent=T.list})T.window:Create('UIPadding',{PaddingTop=UDim.new(0,z),PaddingBottom=UDim.new(0
,z),Parent=T.list})T.emptyLabel=T.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,x),
BackgroundTransparency=1,Text=l.t'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=T.
list},{TextColor3='ContentColor',FontFace='Font'})local function U(V)return table.find(T.value,V)~=nil end
local function V(W,X)local Y=U(W.name)local Z,_,aa,ab=if T._isOpen then(Y and 0.9 or 0.95)else 1,if T._isOpen then(Y and
0 or 0.3)else 1,if T._isOpen then(Y and 0 or 0.7)else 1,if T._isOpen then(Y and 0.85 or 0.93)else 1 j.assign(W.checkIcon
,'Image',if Y then q else r)if X then local ac=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)h
.tweenService:Create(W.frame,ac,{BackgroundTransparency=Z}):Play()h.tweenService:Create(W.title,ac,{TextTransparency=_})
:Play()h.tweenService:Create(W.checkIcon,ac,{ImageTransparency=aa}):Play()h.tweenService:Create(W.stroke,ac,{
Transparency=ab}):Play()else W.frame.BackgroundTransparency=Z W.title.TextTransparency=_ W.checkIcon.ImageTransparency=
aa W.stroke.Transparency=ab end end local function aa()if T.multiSelect then local ab=#T.value if ab==0 then T.
selectedLabel.Text=T.placeholderText elseif ab==1 then T.selectedLabel.Text=T.value[1]else T.selectedLabel.Text=l.
resolve'Various'end else T.selectedLabel.Text=T.value[1]or T.placeholderText end end T._renderOptionState=V T.
_updateSelectedLabel=aa local function ab(ac)local W=T.window:Create('Frame',{Size=UDim2.new(1,-12,0,x),BorderSizePixel=
0,LayoutOrder=#T._optionFrames+1,BackgroundTransparency=1,Parent=T.list},{BackgroundColor3='DropdownHighlight'})local X,
Y,Z,_=T.window:Create('UICorner',{CornerRadius=u,Parent=W}),T.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255
),Transparency=1,Parent=W}),T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',
TextTransparency=1,ZIndex=50,Parent=W}),T.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,
0.5,0),Size=UDim2.fromOffset(170,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=W})T.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=_})local ad,ae=T.window:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(q),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1
,ZIndex=5,Parent=_},{ImageColor3='ContentColor'}),T.window:Create('TextLabel',{Text=ac,Size=UDim2.fromOffset(170,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=_},{TextColor3='ContentColor',FontFace='Font'})local af={name=ac,frame=
W,interact=Z,title=ae,checkIcon=ad,container=_,stroke=Y,corner=X,connections={}}table.insert(af.connections,T.window:
ConnectFor(T,W.MouseEnter,function()if not T._isOpen or not T.window:_interactive()then return end if U(af.name)then
return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=0.9}):Play()h.tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{TextTransparency=0.15}):Play()end))table.insert(af.connections,T.window:ConnectFor(T,W.MouseLeave,
function()if not T._isOpen then return end if U(af.name)then return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.95}):Play()h.tweenService:Create(ae,TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(af.connections,T.
window:ConnectFor(T,Z.MouseButton1Click,function()if not T._isOpen then return end m.click()local ag=U(af.name)if not T.
multiSelect then if ag then T:_close()return end table.clear(T.value)table.insert(T.value,af.name)else if ag then local
ah=table.find(T.value,af.name)if ah then table.remove(T.value,ah)end else table.insert(T.value,af.name)end end T.
_desiredValue=table.clone(T.value)for ah,ai in T._optionFrames do V(ai,true)end aa()T.window:_runGuarded(T,T.callback,T:
_callbackValue())T.window:_persist(T)if not T.multiSelect then task.wait(0.1)T:_close()end end))return af end T.
_buildOption=ab for ac,ad in T.options do local ae=ab(ad)table.insert(T._optionFrames,ae)end aa()T:_updateCorners()T.
window:ConnectFor(T,T.interact.MouseButton1Click,function()m.click()if T._isOpen then T:_close()else T:_open()end end)T.
window:ConnectFor(T,T.main.MouseEnter,function()if T._isOpen or not T.window:_interactive()then return end h.
tweenService:Create(T.title,I,{TextColor3=T.window.theme.ElementTextHoverColor}):Play()h.tweenService:Create(T.
hoverOverlay,I,{BackgroundTransparency=0.97}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeHoverTransparency,Color=T.window.theme.ElementStrokeHover}):Play()end)T.window:ConnectFor(T,T.main.
MouseLeave,function()h.tweenService:Create(T.title,I,{TextColor3=T.window.theme.ContentColor}):Play()h.tweenService:
Create(T.hoverOverlay,I,{BackgroundTransparency=1}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeTransparency,Color=T.window.theme.ElementStroke}):Play()end)if T.description then T.descriptor=d(c.Parent.
descriptor).new(T.tab,{description=T.description})end return T end function f._callbackValue(aa)if aa.multiSelect then
return table.clone(aa.value)end return aa.value[1]end function f._buildSearch(aa)aa._searchOpen=false aa.searchbar=aa.
window:Create('Frame',{Name='Search',Size=UDim2.new(1,-12,0,v),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,LayoutOrder=1,ClipsDescendants=false,ZIndex=1,Parent=aa.panel})aa.window:Create(
'UICorner',{CornerRadius=UDim.new(0,12),Parent=aa.searchbar})aa.searchStroke=aa.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=aa.searchbar})aa.searchShadow=aa.window:CreateGlow(aa.searchbar,Color3.
fromRGB(255,255,255),20,1)aa.searchToggle=aa.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),Text='',TextTransparency=1,ZIndex=51,Parent=aa.searchbar})aa.searchInput=aa.window:Create('TextBox',{Text='',
PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,
Interactable=false,ZIndex=52,TextTransparency=1,Parent=aa.searchbar},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})aa.searchIcon=aa.window:Create('ImageButton',{Image='rbxassetid://'..tostring(s),
Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,ImageTransparency=1,Parent=aa.searchbar},{ImageColor3=
'ContentColor'})aa.window:ConnectFor(aa,aa.searchToggle.MouseButton1Click,function()if not aa._searchOpen then aa:
_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchIcon.MouseButton1Click,function()if aa._searchOpen then aa:
_collapseSearch()else aa:_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchInput:GetPropertyChangedSignal'Text',
function()aa:_applyFilter(aa.searchInput.Text)end)aa.window:ConnectFor(aa,aa.searchInput.FocusLost,function()if aa.
searchInput.Text==''then aa:_collapseSearch()end end)end function f._expandSearch(aa)if aa._searchOpen then return end
aa._searchOpen=true aa.searchInput.TextEditable=true aa.searchInput.Interactable=true h.tweenService:Create(aa.searchbar
,K,{Size=UDim2.new(1,-12,0,w),BackgroundTransparency=0.92}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=
0.86}):Play()h.tweenService:Create(aa.searchShadow,K,{Transparency=0.92}):Play()h.tweenService:Create(aa.searchInput,K,{
TextTransparency=0.3}):Play()aa:_resizeToOptions()aa.searchInput:CaptureFocus()end function f._collapseSearch(aa)if not
aa._searchOpen then return end aa._searchOpen=false aa.searchInput.TextEditable=false aa.searchInput.Interactable=false
aa.searchInput:ReleaseFocus()aa.searchInput.Text=''h.tweenService:Create(aa.searchbar,K,{Size=UDim2.new(1,-12,0,v),
BackgroundTransparency=1}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=1}):Play()h.tweenService:Create(
aa.searchShadow,K,{Transparency=1}):Play()h.tweenService:Create(aa.searchInput,K,{TextTransparency=1}):Play()aa:
_resizeToOptions()end function f._applyFilter(aa,ab)ab=string.lower(ab or'')local ac=0 for ad,ae in aa._optionFrames do
local af=ab==''or string.find(string.lower(ae.name),ab,1,true)~=nil ae.frame.Visible=af if af then ac+=1 end end aa.
emptyLabel.Visible=ac==0 and ab~=''aa:_updateCorners()aa:_resizeToOptions()aa:_syncScrollHint()end function f.
_syncScrollHint(aa)local ab,ac,ad=aa.list.AbsoluteCanvasSize,aa.list.AbsoluteWindowSize,aa.list.CanvasPosition if not ab
or not ac or not ad then return end local ae=aa._isOpen and ac.Y>0 and ab.Y-(ad.Y*aa.window.scale+ac.Y)>1 h.tweenService
:Create(aa.list,H,{ScrollBarImageTransparency=if ae then J else 1}):Play()end function f._visibleOptions(aa):{string}
local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad.name)end end return ab end
function f._buildActions(aa)if not aa.multiSelect then return end aa.actions=aa.window:Create('Frame',{Name='Actions',
Size=UDim2.new(1,-12,0,G),BackgroundTransparency=1,LayoutOrder=2,Parent=aa.panel})aa.window:Create('UIListLayout',{
Padding=UDim.new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=aa.actions})local function ab(ac:string,ad:number,ae:()->())local af=aa.
window:Create('TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,G),BackgroundTransparency=1,Text=
l.t(ac),TextSize=13,TextTransparency=0.45,LayoutOrder=ad,Parent=aa.actions},{TextColor3='ContentColor',FontFace='Font'})
aa.window:ConnectFor(aa,af.MouseEnter,function()h.tweenService:Create(af,H,{TextTransparency=0.15}):Play()end)aa.window:
ConnectFor(aa,af.MouseLeave,function()h.tweenService:Create(af,H,{TextTransparency=0.45}):Play()end)aa.window:
ConnectFor(aa,af.MouseButton1Click,function()ae()aa:_afterBulkChange()end)return af end ab('Select all',1,function()
local ac=aa:_visibleOptions()for ad,ae in ac do if not table.find(aa.value,ae)then table.insert(aa.value,ae)end end end)
ab('Clear',2,function()local ac=aa:_visibleOptions()for ad=#aa.value,1,-1 do if table.find(ac,aa.value[ad])then table.
remove(aa.value,ad)end end end)end function f._afterBulkChange(aa)aa._desiredValue=table.clone(aa.value)for ab,ac in aa.
_optionFrames do aa._renderOptionState(ac,true)end aa:_updateSelectedLabel()aa:_updateCorners()aa.window:_runGuarded(aa,
aa.callback,aa:_callbackValue())aa.window:_persist(aa)m.click()end function f._resizeToOptions(aa)if not aa._isOpen then
return end h.tweenService:Create(aa.main,K,{Size=UDim2.new(1,-20,0,aa:_openHeight())}):Play()end function f.
_updateCorners(aa)local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad)end end for ac
,ad in ab do local ae,af=if ac==1 then t else u,if ac==#ab then t else u ad.corner.TopLeftRadius=ae ad.corner.
TopRightRadius=ae ad.corner.BottomLeftRadius=af ad.corner.BottomRightRadius=af end end local function aa(ab:number):
number return ab*x+math.max(0,ab-1)*y+z*2 end local function ab(ac:number):number return math.max(math.floor((ac-z*2+y)/
(x+y)),1)end function f._pageHeight(ac):number local ad=ac.window.size return n.pageHeight(ad and ad.Y.Offset,ac.window.
layout.mode)end function f._openHeight(ac)local ad=0 for ae,af in ac._optionFrames do if af.frame.Visible then ad+=1 end
end local ae=if ac._searchOpen then w else v local af,ag=A+B+E+ae+y+(if ac.actions then G+y else 0),ac:_pageHeight()
local ah=math.min(math.max(ad,1),F,ab(ag-af))return math.min(af+aa(ah),ag)end function f._open(ac)if ac._isOpen then
return end ac._isOpen=true if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)end ac.
_outsideClickConn=ac.window:Connect(h.userInputService.InputBegan,function(ad)if ad.UserInputType~=Enum.UserInputType.
MouseButton1 and ad.UserInputType~=Enum.UserInputType.Touch then return end local ae,af,ag=ad.Position,ac.main.
AbsolutePosition,ac.main.AbsoluteSize if ae.X<af.X or ae.X>af.X+ag.X or ae.Y<af.Y or ae.Y>af.Y+ag.Y then ac:_close()end
end)h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,ac:_openHeight())}):Play()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=ac.window.theme.ElementTransparency or 0}):Play()h.tweenService:
Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=ac.window.theme.
ElementStrokeTransparency}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.5}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end
ac:_syncScrollHint()ac:_bringIntoView()end function f._bringIntoView(ac)local ad=ac.tab and ac.tab.tabPage if not ad
then return end local ae,af,ag,ah=ad.AbsoluteWindowSize,ad.CanvasPosition,ad.AbsolutePosition,ac.main.AbsolutePosition
if not ae or not af or not ag or not ah or ae.Y<=0 then return end local ai=ac.window.scale local P=(ah.Y-ag.Y)/ai+af.Y
local Q=P+ac:_openHeight()local R=Q-(af.Y+ae.Y/ai)if R<=0 then return end local S=math.min(af.Y+R+8,P)h.tweenService:
Create(ad,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{CanvasPosition=Vector2.new(af.X,S)}):Play(
)end function f._close(ac)if not ac._isOpen then return end ac._isOpen=false if ac._outsideClickConn then ac.window:
Disconnect(ac._outsideClickConn)ac._outsideClickConn=nil end ac:_collapseSearch()ac:_syncScrollHint()h.tweenService:
Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):Play()h.
tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=
1}):Play()h.tweenService:Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out),{ImageTransparency=1}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end h.tweenService:
Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):
Play()end function f._destroyOption(ac,ad)if ad.connections then for ae,af in ad.connections do local ag=table.find(ac.
connections,af)if ag then table.remove(ac.connections,ag)end ac.window:Disconnect(af)end ad.connections=nil end ac.
window:DestroySubtree(ad.frame)end function f._deriveSelection(ac)local ad=ac.value ac.value=N(ac._desiredValue or ac.
value,ac.options)return not O(ac.value,ad)end function f._reindexOptions(ac)for ad,ae in ac._optionFrames do ae.frame.
LayoutOrder=ad end end function f._rebindOption(ac,ad,ae,af)ad.name=ae ad.title.Text=ae ad.frame.LayoutOrder=af end
function f._destroyOptionsFrom(ac,ad)local ae,af={},{}for ag=#ac._optionFrames,ad,-1 do local ah=ac._optionFrames[ag]
table.insert(ae,ah.frame)if ah.connections then table.move(ah.connections,1,#ah.connections,#af+1,af)ah.connections=nil
end ac._optionFrames[ag]=nil end ac.window:DisconnectMany(ac,af)ac.window:DestroySubtrees(ae)end function f.Refresh(ac,
ad)ac.options=L(ad or{})local ae,af,ag=ac:_deriveSelection(),#ac._optionFrames,#ac.options for ah=1,math.min(af,ag)do ac
:_rebindOption(ac._optionFrames[ah],ac.options[ah],ah)end for ah=af+1,ag do local ai=ac._buildOption(ac.options[ah])ai.
frame.LayoutOrder=ah table.insert(ac._optionFrames,ai)end if ag<af then ac:_destroyOptionsFrom(ag+1)end for ah,ai in ac.
_optionFrames do ac._renderOptionState(ai,false)end ac._updateSelectedLabel()ac:_applyFilter(if ac._searchOpen then ac.
searchInput.Text else'')if ae then ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end
end function f.Add(ac,ad)if typeof(ad)~='string'or ad==''then return end if table.find(ac.options,ad)then return end
table.insert(ac.options,ad)local ae=ac._buildOption(ad)table.insert(ac._optionFrames,ae)local af=ac:_deriveSelection()if
ac._isOpen then ac._renderOptionState(ae,true)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if
af then ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end
function f.Remove(ac,ad)local ae=table.find(ac.options,ad)if not ae then return end table.remove(ac.options,ae)for af,ag
in ac._optionFrames do if ag.name==ad then ac:_destroyOption(ag)table.remove(ac._optionFrames,af)ac:_reindexOptions()
break end end if ac._desiredValue then local af=table.find(ac._desiredValue,ad)if af then table.remove(ac._desiredValue,
af)end end local af=table.find(ac.value,ad)if af then table.remove(ac.value,af)ac._updateSelectedLabel()ac.window:
_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end ac:_applyFilter(if ac._searchOpen then ac.
searchInput.Text else'')end function f.Set(ac,ad,ae)local af=M(ad,ac.multiSelect)ac._desiredValue=af ac.value=N(af,ac.
options)for ag,ah in ac._optionFrames do ac._renderOptionState(ah,true)end ac._updateSelectedLabel()if not ae then ac.
window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f._setShown(ac,ad,ae)local
af=ac.window af:_reveal(ac.stroke,{Transparency=if ad then af.theme.ElementStrokeTransparency else 1},ae)af:_reveal(ac.
title,{TextTransparency=if ad then 0 else 1},ae)af:_reveal(ac.top,{BackgroundTransparency=if ad then(af.theme.
ElementTransparency or 0)else 1},ae)if ac.iconLabel then af:_reveal(ac.iconLabel,{ImageTransparency=if ad then 0 else 1}
,ae)end if ac.descriptor then af:_reveal(ac.descriptor.titleLabel,{TextTransparency=if ad then 0.7 else 1},ae)end af:
_reveal(ac.selectedLabel,{TextTransparency=if ad then 0.5 else 1},ae)af:_reveal(ac.chevron,{ImageTransparency=if ad then
0.5 else 1},ae)if not ad and ac._isOpen then ac:_close()end end function f.MoveTo(ac,ad)ac.tab:_moveElement(ac,ad)end
function f.MoveToTop(ac)ac.tab:_moveElement(ac,1)end function f.MoveToBottom(ac)ac.tab:_moveElement(ac,#ac.tab.elements)
end function f.MoveUp(ac)local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad-1)end end function
f.MoveDown(ac)local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad+1)end end o(f)return f end)()
end,[12]=function()local aa,ab,ac=a(12)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Group'local af,
ag,ah,ai,b=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.log),ac(ab.Parent.Parent.utility.ordering),
8,{button=true,toggle=true,stat=true,slider=true}function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=string.
lower(d.direction or d.Direction or'row')local f=e=='column'or e=='vertical'local g=not f local h=if g then Enum.
FillDirection.Horizontal else Enum.FillDirection.Vertical local i,j=setmetatable({tab=assert(c,
'Missing argument #1 (Tab expected)'),window=c.window,direction=h,compact=g,forgetState=c.forgetState,elements={}},ae),c
.direction==Enum.FillDirection.Horizontal i.main=i.window:Create('Frame',{Name='Group',BackgroundTransparency=1,
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=if g then UDim2.new(1,-20,0,0)else UDim2.new(1,0,0,0),Parent=i
.tab.tabPage})if j then i.main.Size=UDim2.new(0,0,0,0)i.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent
=i.main})end i.tabPage=i.main i.layout=i.window:Create('UIListLayout',{FillDirection=h,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,ai),VerticalAlignment=if g then Enum.VerticalAlignment.Center else Enum.VerticalAlignment
.Top,HorizontalAlignment=if g then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,Parent=i.main})
return i end function ae._add(c,d,e)if c.compact and not b[d]then ag.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{
d}'. Use a column for it.`)return nil end local f=ac(ab.Parent[d]).new(c,e)table.insert(c.elements,f)ah(f,#c.elements*10
)c.window:_restoreLate(f)if c.compact then c:_wrapChild(f)end c:_reflowRow()if not c.window.hidden then f:_setShown(true
,true)end return f end function ae._reflowRow(c)if c.direction~=Enum.FillDirection.Horizontal then return end local d=#c
.elements>0 for e,f in c.elements do if f.__type~='Group'then d=false break end end c.layout.Padding=if d then UDim.new(
0,-10)else UDim.new(0,ai)end function ae._wrapChild(c,d)c.layout.Wraps=true c.layout.HorizontalFlex=Enum.UIFlexAlignment
.Fill d._widthManaged=true local e=if d._minWidth then d:_minWidth()else 0 if e>0 then d.main.AutomaticSize=Enum.
AutomaticSize.None d.main.Size=UDim2.new(0,e,d.main.Size.Y.Scale,d.main.Size.Y.Offset)end end function ae.CreateButton(c
,d)return c:_add('button',d)end function ae.CreateToggle(c,d)return c:_add('toggle',d)end function ae.CreateSwitch(c,d)
return c:_add('toggle',d)end function ae.CreateStat(c,d)return c:_add('stat',d)end function ae.CreateSlider(c,d)return c
:_add('slider',d)end function ae.CreateDropdown(c,d)return c:_add('dropdown',d)end function ae.CreateSection(c,d)return
c:_add('section',d)end function ae.CreateText(c,d)return c:_add('text',d)end function ae.CreateDivider(c,d)return c:
_add('divider',d)end function ae._addGroup(c,d)d=if typeof(d)=='table'then table.clone(d)else{}if c.direction==Enum.
FillDirection.Horizontal then c.layout.VerticalAlignment=Enum.VerticalAlignment.Top if c.tab.direction~=Enum.
FillDirection.Horizontal then c.main.Size=UDim2.new(1,0,0,0)end end local e=ae.new(c,d)table.insert(c.elements,e)e.main.
LayoutOrder=#c.elements*10 c:_reflowRow()return e end function ae.CreateGroup(c,d)return c:_addGroup(d)end function ae.
_moveElement(c,d,e)local f=table.find(c.elements,d)if not f then return end table.remove(c.elements,f)e=math.clamp(e,1,#
c.elements+1)table.insert(c.elements,e,d)for g,h in c.elements do ah(h,g*10)end end function ae._setShown(c,d,e)for f,g
in c.elements do g:_setShown(d,e)end end function ae._refreshTheme(c)for d,e in c.elements do if e._refreshTheme then e:
_refreshTheme()end end end af(ae)return ae end)()end,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Input'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(
af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine)local f,g=d.
pillResizeInfo,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function h(i)local j,k=i:match
'^([%d%.%-]+)%^([%d%.%-]+)$'if j and k then local l,m=tonumber(j),tonumber(k)if l and m then return l^m end end return
tonumber(i)end function ae.new(i,j)j=if typeof(j)=='table'then j else{}local k=setmetatable({tab=assert(i,
'Missing argument #1 (Tab expected)'),window=i.window,name=j.name or j.Name or'Input',icon=j.icon or j.Icon,description=
j.description or j.Description,forgetState=j.forgetState or j.ForgetState or i.forgetState,placeholder=j.placeholder or
j.Placeholder or j.PlaceholderText or'',numeric=j.numeric or j.Numeric or false,clearOnFocus=j.clearOnFocus or j.
ClearOnFocus or false,callback=j.callback or j.Callback or function()end},ae)k.value=tostring(j.value or j.Value or j.
currentValue or j.CurrentValue or'')k.flag=j.flag or j.Flag or(not k.forgetState and ah.deriveFlagFromName(k.name)or nil
)k.window:_registerControl(k)k.main=k.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=k.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k.hoverOverlay=k.window:CreateHoverOverlay(k.main)k.
container=k.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=k.main})k.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=k.container}
)if k.icon then k.iconLabel=k.window:Create('ImageLabel',{Image=k.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=k.container},{ImageColor3='ContentColor'})end k.title=k.
window:Create('TextLabel',{Text=c.t(k.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=k.container},{TextColor3='ContentColor',FontFace='Font'})k.box=k.window:Create('Frame',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(85,30),BorderSizePixel=0,
BackgroundTransparency=1,Parent=k.main},{BackgroundColor3='FieldBackground'})k.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=k.box})k.boxStroke=k.window:Create('UIStroke',{Transparency=1,Parent=k.box},{Color='SurfaceStroke'}
)k.glow=k.window:CreateGlow(k.box,'FieldGlow',20,1)k._glowIdle=1 k.input=k.window:Create('TextBox',{Text=k.value,
PlaceholderText=c.t(k.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=
Enum.TextTruncate.AtEnd,ClearTextOnFocus=k.clearOnFocus,TextTransparency=1,Parent=k.box},{TextColor3='ContentColor',
FontFace='Font',PlaceholderColor3='PlaceholderColor'})k.window:ConnectFor(k,k.input:GetPropertyChangedSignal'Text',
function()if k.numeric then local l=(k.input.Text:gsub('[^%d%.%-eE%^]',''))if l~=k.input.Text then k.input.Text=l return
end end k:_sizeBox(true)end)k.window:ConnectFor(k,k.input.Focused,function()ag.tweenService:Create(k.input,g,{
TextTransparency=0}):Play()end)k.window:ConnectFor(k,k.input.FocusLost,function()ag.tweenService:Create(k.input,g,{
TextTransparency=0.6}):Play()if k.clearOnFocus and k.input.Text==''and k.value~=''then k.input.Text=k.value return end
if k.input.Text==k.value then return end k:_commit(k.input.Text)end)k.window:_wireElementHover(k)if k.description then k
.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})end k:_sizeBox(false)return k end function ae
._sizeBox(i,j)local k=i.input.Text~=''and i.input.Text or i.placeholder local l=math.clamp(ah.textWidth(i.window.theme.
Font,15,k)+30,70,220)if j then ag.tweenService:Create(i.box,f,{Size=UDim2.fromOffset(l,30)}):Play()else i.box.Size=UDim2
.fromOffset(l,30)end end function ae._commit(i,j,k)j=tostring(j)if i.numeric then local l=h(j)if not l or l~=l or l==
math.huge or l==-math.huge then if i.input.Text~=i.value then i.input.Text=i.value end return end j=tostring(l)end local
l=j~=i.value i.value=j if i.input.Text~=j then i.input.Text=j end if not k then i.window:_runGuarded(i,i.callback,j)i.
window:_persist(i)if l and not i.window._loading then e.click()i.window:_flashResult(i,true)end end end function ae.Set(
i,j,k)i:_commit(j,k)end function ae._setShown(i,j,k)local l=i.window if j then l:_revealCommon(i,k)l:_reveal(i.box,{
BackgroundTransparency=l.theme.FieldTransparency},k)l:_reveal(i.boxStroke,{Transparency=0.85},k)l:_reveal(i.input,{
TextTransparency=0.6},k)else l:_hideCommon(i,k)l:_reveal(i.box,{BackgroundTransparency=1},k)l:_reveal(i.boxStroke,{
Transparency=1},k)l:_reveal(i.input,{TextTransparency=1},k)end end function ae._refreshTheme(i)ag.tweenService:Create(i.
box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=i.window.theme.
FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[14]=function()local aa,ab,ac=a(14)local ad return(function
(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f,g=ac(af.
variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine),ac(af.
enums),ac(af.log)local h,i,j=d.pillResizeInfo,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[Enum
.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'}
local function k(l)if typeof(l)~='EnumItem'or l==Enum.KeyCode.Unknown then return'None'end return j[l]or l.Name end
local function l(m)if typeof(m)=='EnumItem'then return m end if type(m)=='string'then local n,o=pcall(function()return
Enum.KeyCode[m]end)if n and o then return o end local p,q=pcall(function()return Enum.UserInputType[m]end)if p and q and
j[q]then return q end end return Enum.KeyCode.Unknown end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local
o=setmetatable({tab=assert(m,'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Keybind',
icon=n.icon or n.Icon,description=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.
forgetState,isMenuToggle=n.isMenuToggle or n.IsMenuToggle or false,callback=n.callback or n.Callback or function()end,
onChanged=n.onChanged or n.OnChanged or function()end,hold=n.hold or n.Hold or n.HoldToInteract or false,holdThreshold=n
.holdThreshold or n.HoldThreshold or 0.2,recording=false},ae)o.value=l(n.value or n.Value or n.default or n.Default or n
.currentKeybind or n.CurrentKeybind)o.flag=n.flag or n.Flag or(not o.forgetState and ah.deriveFlagFromName(o.name)or nil
)o.window:_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o.hoverOverlay=o.window:CreateHoverOverlay(o.main)o.
container=o.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=o.main})o.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=o.container}
)if o.icon then o.iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=o.container},{ImageColor3='ContentColor'})end o.title=o.
window:Create('TextLabel',{Text=c.t(o.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})o.box=o.window:Create('TextButton',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(40,30),AutoButtonColor=false,Text='',
BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='FieldBackground'})o.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=o.box})o.boxStroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.box
},{Color='SurfaceStroke'})o.glow=o.window:CreateGlow(o.box,'FieldGlow',20,1)o._glowIdle=0.9 o.keyLabel=o.window:Create(
'TextLabel',{Text=k(o.value),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,TextTransparency=1,Parent=o.box},{TextColor3='ContentColor',FontFace=
'Font'})o.window:ConnectFor(o,o.box.MouseButton1Click,function()e.click()if o.recording then o:_stopRecording()else o:
_startRecording()end end)o.window:ConnectFor(o,ag.userInputService.InputBegan,function(p,q)if q then return end if o.
recording then o:_capture(p)return end if o.window._recordingKeybind then return end if o:_matches(p)then if o.hold then
o:_beginHold(p)else o.window:_runGuarded(o,o.callback,o.value)end end end)o.window:_wireElementHover(o)if o.description
then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.description})end o:_sizeBox(false)return o end
function ae._sizeBox(m,n)local o=math.clamp(ah.textWidth(m.window.theme.Font,15,m.keyLabel.Text)+28,40,200)if n then ag.
tweenService:Create(m.box,h,{Size=UDim2.fromOffset(o,30)}):Play()else m.box.Size=UDim2.fromOffset(o,30)end end function
ae._startRecording(m)local n=m.window._recordingKeybind if n and n~=m then n:_stopRecording()end m.recording=true m.
window._recordingKeybind=m m.keyLabel.Text=c.resolve'Recording'm:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.7}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0}):Play()end function ae._stopRecording(
m)m.recording=false if m.window._recordingKeybind==m then local n=m.window task.defer(function()if n._recordingKeybind==
m then n._recordingKeybind=nil end end)end m.keyLabel.Text=k(m.value)m:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.9}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0.6}):Play()end function ae._capture(m,n)
local o if n.UserInputType==Enum.UserInputType.Keyboard then if n.KeyCode==Enum.KeyCode.Escape then m:_stopRecording()
return end if n.KeyCode==Enum.KeyCode.Backspace then m:_bind(Enum.KeyCode.Unknown)return end o=n.KeyCode elseif n.
UserInputType==Enum.UserInputType.MouseButton2 or n.UserInputType==Enum.UserInputType.MouseButton3 then o=n.
UserInputType end if not o then return end if m.isMenuToggle then local p=m.window:_keybindUsing(o,m)if p then m.window:
Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is bound to %s. Kept %s.',k(o),p.name,k(m
.value))}m:_stopRecording()m.window:_flashResult(m,false)return end elseif o==m.window.settings.toggleKeybind then m.
window:Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is the menu toggle key. Kept %s.',
k(o),k(m.value))}m:_stopRecording()m.window:_flashResult(m,false)return end m:_bind(o)end function ae._bind(m,n)m.value=
n m:_stopRecording()m.window:_runGuarded(m,m.onChanged,n)m.window:_persist(m)m.window:_flashResult(m,true)end function
ae._matches(m,n)local o=m.value if typeof(o)~='EnumItem'or o==Enum.KeyCode.Unknown then return false end if o.EnumType==
Enum.KeyCode then return n.KeyCode==o elseif o.EnumType==Enum.UserInputType then return n.UserInputType==o end return
false end function ae._beginHold(m,n)if m._holding or m._holdPress then return end local o={}m._holdPress=o local p,q=n.
KeyCode,n.UserInputType task.delay(m.holdThreshold,function()if m._holdPress~=o then return end m._holding=true m.window
:_runGuarded(m,m.callback,true)end)local r r=m.window:ConnectFor(m,ag.userInputService.InputEnded,function(s)local t=if
p~=Enum.KeyCode.Unknown then s.KeyCode==p else s.UserInputType==q if not t then return end if m.connections then local u
=table.find(m.connections,r)if u then table.remove(m.connections,u)end end m.window:Disconnect(r)if m._holdPress==o then
m._holdPress=nil end if m._holding then m._holding=false m.window:_runGuarded(m,m.callback,false)end end)end function ae
.Set(m,n,o)local p=l(n)if p~=Enum.KeyCode.Unknown then if m.isMenuToggle then local q=m.window:_keybindUsing(p,m)if q
then g.warn('Rayfield: '..k(p).." is bound to '"..tostring(q.name).."'; kept "..k(m.value))return end elseif p==m.window
.settings.toggleKeybind then g.warn('Rayfield: '..k(p)..' is the menu toggle key; kept '..k(m.value))return end end m.
value=p if m.recording then m:_stopRecording()else m.keyLabel.Text=k(m.value)m:_sizeBox(true)end if not o then m.window:
_runGuarded(m,m.onChanged,m.value)m.window:_persist(m)end end function ae._serialize(m)return{tostring(m.value.EnumType)
,m.value.Value}end function ae._deserialize(m,n)local o=tostring(n[1]):gsub('^Enum%.','')local p,q=pcall(function()
return Enum[o]end)if not p or not q then return end local r=f.itemFromValue(q,n[2])if r then m:Set(r)end end function ae
._setShown(m,n,o)local p=m.window if n then p:_revealCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=p.theme.
FieldTransparency},o)p:_reveal(m.boxStroke,{Transparency=0.85},o)p:_reveal(m.keyLabel,{TextTransparency=0.6},o)p:
_reveal(m.glow,{Transparency=0.9},o)else p:_hideCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=1},o)p:_reveal(m.
boxStroke,{Transparency=1},o)p:_reveal(m.keyLabel,{TextTransparency=1},o)p:_reveal(m.glow,{Transparency=1},o)end end
function ae._refreshTheme(m)ag.tweenService:Create(m.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=m.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[15]=function()
local aa,ab,ac=a(15)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.
Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine)
,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential
,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function l(m)return math.clamp(#m*0.06+3,
3,9)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({window=assert(m,
'Missing argument #1 (Window expected)'),title=n.title or n.Title or'Notification',content=n.content or n.Content or'',
icon=n.icon or n.Icon,_hovered=false,_dismissed=false},ae)o.duration=n.duration or n.Duration or l(o.content)local p=o.
icon~=nil and o.icon~=0 and o.icon~=''o.main=o.window:Create('Frame',{Name='Notification',BackgroundTransparency=1,Size=
UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=o.window.notifications})o.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,k),Parent=o.main})o.body=o.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255
,255,255),Size=UDim2.new(1,0,1,0),Position=h,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.
zIndex.notification,BackgroundTransparency=1,Parent=o.main})o.window:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.toColorSequence}})o.window:Create('UICorner',{Parent=o.body},{
CornerRadius='CornerRoundness'})o.stroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.body},{Color=
'SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1)o.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,20),PaddingRight=UDim.new(0,20),Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=o.body})if p then o.iconLabel=o.window:Create('ImageLabel',{
Image=o.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.
notification,ImageTransparency=1,Parent=o.body},{ImageColor3='ContentColor'})end o.container=o.window:Create('Frame',{
Size=UDim2.fromOffset(p and 222 or 260,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=o.container})o.titleLabel=o.
window:Create('TextLabel',{Text=o.title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.
zIndex.notification,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='TitleFont'})if o.content
~=''then o.descriptionLabel=o.window:Create('TextLabel',{Text=o.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=o.container
},{TextColor3='ContentColor',FontFace='Font'})end o.window._notificationCount=(o.window._notificationCount or 0)+1 o.
main.LayoutOrder=-o.window._notificationCount local q=o.window._liveNotifications if not q then q={}o.window.
_liveNotifications=q end table.insert(q,o)while#q>j do local r=table.remove(q,1)if r and r~=o then task.spawn(r._dismiss
,r)end end o._connections={o.window:Connect(o.body.MouseEnter,function()o._hovered=true end),o.window:Connect(o.body.
MouseLeave,function()o._hovered=false end),o.window:Connect(o.body.InputBegan,function(r)if r.UserInputType==Enum.
UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch then o:_dismiss()end end)}task.spawn(function()o
:_show()end)return o end function ae._measure(m)local n=m.iconLabel and 222 or 260 local o=ah.textHeight(m.window.theme.
TitleFont,16,m.title,n)if m.descriptionLabel then o=o+4+ah.textHeight(m.window.theme.Font,15,m.content,n)end return math
.max(o,m.iconLabel and 24 or 0)+28 end function ae._show(m)local n=m:_measure()+k if m._dismissed or not m.main.Parent
then return end b.notify()ag.tweenService:Create(m.main,c,{Size=UDim2.new(1,0,0,n)}):Play()ag.tweenService:Create(m.body
,f,{Position=i}):Play()ag.tweenService:Create(m.body,d,{BackgroundTransparency=0}):Play()ag.tweenService:Create(m.
titleLabel,e,{TextTransparency=0}):Play()ag.tweenService:Create(m.stroke,d,{Transparency=0.95}):Play()ag.tweenService:
Create(m.shadow,e,{Transparency=0.6}):Play()task.wait(0.05)if m._dismissed or not m.main.Parent then return end if m.
iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=0}):Play()end task.wait(0.05)if m._dismissed or
not m.main.Parent then return end if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e,{
TextTransparency=0.35}):Play()end local o=0 while o<m.duration and not m._dismissed and m.main.Parent do local p=task.
wait()if not m._hovered then o+=p end end m:_dismiss()end function ae._dismiss(m)if m._dismissed then return end m.
_dismissed=true local n=m.window._liveNotifications local o=n and table.find(n,m)if n and o then table.remove(n,o)end if
not m.main.Parent then return end ag.tweenService:Create(m.body,d,{BackgroundTransparency=1}):Play()ag.tweenService:
Create(m.stroke,d,{Transparency=1}):Play()ag.tweenService:Create(m.shadow,e,{Transparency=1}):Play()ag.tweenService:
Create(m.titleLabel,e,{TextTransparency=1}):Play()if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e
,{TextTransparency=1}):Play()end if m.iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=1}):Play()
end ag.tweenService:Create(m.body,g,{Size=UDim2.new(1,-90,1,0)}):Play()local p=ag.tweenService:Create(m.main,g,{Size=
UDim2.new(1,0,0,0)})p:Play()p.Completed:Wait()if not m.main.Parent then return end for q,r in m._connections do m.window
:Disconnect(r)end m.window:DestroySubtree(m.main)end return ae end)()end,[16]=function()local aa,ab,ac=a(16)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f
,g,h,i,j,k,l,m,n=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),
TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),400,0.95,22,24,22,16 local o,p,q,r,s,t,u,v=i-k*2,18,14,15,16,12,
300,4 local w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L=o-v*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function M()
for N=#K,1,-1 do local O=K[N]if O._closed or not O.screenGui.Parent then table.remove(K,N)end end end local function N(O
)M()return K[#K]==O end function ae.new(O,P)P=if typeof(P)=='table'then P else{}local Q=setmetatable({window=assert(O,
'Missing argument #1 (Window expected)'),title=P.title or P.Title or'Popup',subtitle=P.subtitle or P.Subtitle,content=P.
content or P.Content,icon=P.icon or P.Icon,boxes=P.boxes or P.Boxes,options=P.options or P.Options,dismissable=if P.
dismissable~=nil then P.dismissable elseif P.Dismissable~=nil then P.Dismissable else true,_reveal={},_connections={},
_closed=false},ae)if not Q.options or#Q.options==0 then Q.options={{text='Okay'}}end Q:_build()M()table.insert(K,Q)task.
spawn(function()Q:_show()end)return Q end function ae._fade(O,P,Q,R)table.insert(O._reveal,{instance=P,prop=Q,to=R})
return P end function ae._build(O)local P,Q=O.window,O.icon~=nil and O.icon~=0 and O.icon~=''O.screenGui=P:Create(
'ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai
.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})O.backdrop=P:Create('Frame',{Name=
'Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,
BackgroundTransparency=1,Parent=O.screenGui})O:_fade(O.backdrop,'BackgroundTransparency',J)O.card=P:Create('Frame',{Name
='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),
Size=UDim2.fromOffset(i,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,
Parent=O.screenGui})O:_fade(O.card,'BackgroundTransparency',0)P:_scaleOverlay(O.card,j)P:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=O.card},{Color={'WindowColor',ah.toColorSequence}})P:Create('UICorner',{Parent=O.
card},{CornerRadius='CornerRoundness'})O.cardStroke=P:Create('UIStroke',{Transparency=1,Parent=O.card},{Color=
'SurfaceStroke'})O:_fade(O.cardStroke,'Transparency',0.95)O.cardShadow=P:CreateGlow(O.card,'ShadowColor',26,1)O:_fade(O.
cardShadow,'Transparency',0.55)P:Create('UIPadding',{PaddingLeft=UDim.new(0,k),PaddingRight=UDim.new(0,k),PaddingTop=
UDim.new(0,l),PaddingBottom=UDim.new(0,m),Parent=O.card})P:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,n),
Parent=O.card})local R=O:_measureHeader(Q)O:_buildHeader(Q,R)local S=O:_buildContent()O:_buildFooter()local T=2+(S>0 and
1 or 0)local U=l+R+S+F+m+n*(T-1)O.card.Size=UDim2.fromOffset(i,U)O.card.AutomaticSize=Enum.AutomaticSize.None if O.
dismissable then table.insert(O._connections,P:Connect(O.backdrop.InputBegan,function(V)if V.UserInputType==Enum.
UserInputType.MouseButton1 or V.UserInputType==Enum.UserInputType.Touch then O:Close()end end))table.insert(O.
_connections,P:Connect(ag.userInputService.InputBegan,function(V,W)if not W and V.KeyCode==Enum.KeyCode.Escape and N(O)
then if V==L then return end L=V O:Close()end end))end end function ae._buildHeader(O,P,Q)local R=O.window local S=R:
Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,Q),LayoutOrder=1,Parent=O.card})R:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,t),Parent=S})
if P then O:_fade(R:Create('ImageLabel',{Image=O.icon,Size=UDim2.fromOffset(s,s),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=S},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end
local T=R:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,P and-(s+t)or 0,0,O._columnH),
LayoutOrder=2,Parent=S})R:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,3),Parent=T})O:_fade(R:Create('TextLabel',{Text=b.t(O.title),Size=UDim2.new(1,0,0,O.
_titleH),BackgroundTransparency=1,TextSize=p,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=T},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if O.subtitle and O.
subtitle~=''then O:_fade(R:Create('TextLabel',{Text=b.t(O.subtitle),Size=UDim2.new(1,0,0,O._subH),BackgroundTransparency
=1,TextSize=q,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=T},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function ae._buildContent(O)if(not O.content
or O.content=='')and(not O.boxes or#O.boxes==0)then return 0 end local P,Q=O.window,if O.boxes and#O.boxes>0 then O:
_measureBoxes()else O:_measureText()local R=math.min(Q,u)+v*2 local S=P:Create('ScrollingFrame',{Name='Content',
BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,R),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=
Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=O.card})O:_fade(S,'ScrollBarImageTransparency',
0.8)P:Create('UIPadding',{PaddingLeft=UDim.new(0,v),PaddingRight=UDim.new(0,v),PaddingTop=UDim.new(0,v),PaddingBottom=
UDim.new(0,v),Parent=S})if O.boxes and#O.boxes>0 then P:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical
,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,D),Parent=S
})for T,U in O.boxes do O:_buildBox(S,U,T)end else O:_fade(P:Create('TextLabel',{Text=b.t(O.content),Size=UDim2.new(1,0,
0,Q),BackgroundTransparency=1,TextSize=r,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=S},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return R end function ae._buildBox(O,P,Q,R)local S=O.window Q=if typeof(Q)=='table'then Q else{title=tostring(Q)}local T
,U,V,W,X=Q.icon~=nil and Q.icon~=0 and Q.icon~='',O:_measureBox(Q)local Y=S:Create('Frame',{Name='Box',BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-E,0,U),LayoutOrder=R,BackgroundTransparency=1,Parent=P})
O:_fade(Y,'BackgroundTransparency',0)local Z=S:StyleElementPanel(Y)O:_fade(Z,'Transparency',S.theme.
ElementStrokeTransparency)S:Create('UIPadding',{PaddingLeft=UDim.new(0,x),PaddingRight=UDim.new(0,x),PaddingTop=UDim.
new(0,y),PaddingBottom=UDim.new(0,y),Parent=Y})S:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,A),Parent=Y})if T then O:_fade(S:Create('ImageLabel',{Image=Q.icon,Size=UDim2.
fromOffset(z,z),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=Y},{ImageColor3=
'ContentColor'}),'ImageTransparency',0)end local _=S:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,T and-(z+
A)or 0,0,X),LayoutOrder=2,Parent=Y})S:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=_})O:_fade(S:Create('TextLabel',{Text=b.t(Q.title or Q.Title or''),
Size=UDim2.new(1,0,0,V),BackgroundTransparency=1,TextSize=B,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=_},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local
aj=Q.description or Q.Description if aj and aj~=''then O:_fade(S:Create('TextLabel',{Text=b.t(aj),Size=UDim2.new(1,0,0,W
),BackgroundTransparency=1,TextSize=C,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=_},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function ae._buildFooter(aj)local O=aj.window local P=O:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,F),LayoutOrder=3,Parent=aj.card})O:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,G),Parent=P})for Q,R in aj.options do aj:_buildButton(P,R,Q)end end function ae._buildButton(aj,O,P,Q)local R=aj.
window P=if typeof(P)=='table'then P else{text=tostring(P)}local S,T,U,V,W,X,Y=P.style or P.Style or'neutral',P.text or
P.Text or P.name or P.Name or'Okay',P.callback or P.Callback if S=='primary'then V,W,X,Y=R.theme.AccentColor,R.theme.
AccentStroke,R.theme.AccentStroke,0.1 elseif S=='danger'then V,W,X,Y=R.theme.ErrorColor,R.theme.ErrorStrokeColor,R.theme
.ErrorStrokeColor,0 else V,W,X,Y=R.theme.NeutralButton,R.theme.NeutralButtonHover,R.theme.NeutralButtonStroke,0.85 end
local Z=R:Create('Frame',{Name='Button',BackgroundColor3=V,BorderSizePixel=0,Size=UDim2.new(0,0,0,F),LayoutOrder=Q,
BackgroundTransparency=1,Parent=O})aj:_fade(Z,'BackgroundTransparency',0)R:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode
.Fill,Parent=Z})R:Create('UICorner',{CornerRadius=H,Parent=Z})local _=R:Create('UIStroke',{Color=X,Transparency=1,Parent
=Z})aj:_fade(_,'Transparency',Y)aj:_fade(R:Create('TextLabel',{Text=b.t(T),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,TextSize=I,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,
TextColor3=ah.contrastText(V),TextTransparency=1,Parent=Z},{FontFace='Font'}),'TextTransparency',0)local ak,al=R:Create(
'TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=Z}),TweenInfo
.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(aj._connections,R:Connect(ak.MouseEnter,function(
)if aj._closed then return end ag.tweenService:Create(Z,al,{BackgroundColor3=W}):Play()end))table.insert(aj._connections
,R:Connect(ak.MouseLeave,function()ag.tweenService:Create(Z,al,{BackgroundColor3=V}):Play()end))table.insert(aj.
_connections,R:Connect(ak.MouseButton1Click,function()if aj._closed then return end d.click()ag.tweenService:Create(_,al
,{Transparency=1}):Play()if U then task.spawn(function()local am,an=pcall(U)if not am then c.warn(
"Rayfield: popup button '"..T.."' callback errored:")c.print(an)end end)end aj:Close()end))end function ae.
_measureHeader(aj,ak)local al=o-(if ak then s+t else 0)aj._titleH=ah.textHeight(aj.window.theme.Font,p,b.resolve(aj.
title),al)aj._subH=if aj.subtitle and aj.subtitle~=''then ah.textHeight(aj.window.theme.Font,q,b.resolve(aj.subtitle),al
)else 0 aj._columnH=aj._titleH+(if aj._subH>0 then 3+aj._subH else 0)return math.max(aj._columnH,if ak then s else 0)end
function ae._measureText(aj)return ah.textHeight(aj.window.theme.Font,r,b.resolve(aj.content),w)end function ae.
_measureBox(aj,ak)ak=if typeof(ak)=='table'then ak else{title=tostring(ak)}local al=ak.icon~=nil and ak.icon~=0 and ak.
icon~=''local am=w-E-x*2-(if al then z+A else 0)local an,O,P=ah.textHeight(aj.window.theme.TitleFont,B,b.resolve(ak.
title or ak.Title or''),am),0,ak.description or ak.Description if P and P~=''then O=ah.textHeight(aj.window.theme.Font,C
,b.resolve(P),am)end local Q=an+(if O>0 then 3+O else 0)local R=math.max(Q,if al then z else 0)+y*2 return R,an,O,Q end
function ae._measureBoxes(aj)local ak=0 for al,am in aj.boxes do ak+=(aj:_measureBox(am))if al<#aj.boxes then ak+=D end
end return ak end function ae._show(aj)if not aj.screenGui.Parent then return end d.notify()ag.tweenService:Create(aj.
card,e,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for ak,al in aj._reveal do local am=if al.instance==aj.backdrop then h
else f ag.tweenService:Create(al.instance,am,{[al.prop]=al.to}):Play()end end function ae.Close(aj)if aj._closed then
return end aj._closed=true local ak=table.find(K,aj)if ak then table.remove(K,ak)end for al,am in aj._connections do aj.
window:Disconnect(am)end aj._connections={}if not aj.screenGui.Parent then return end ag.tweenService:Create(aj.card,g,{
Position=UDim2.new(0.5,0,0.5,10)}):Play()for al,am in aj._reveal do ag.tweenService:Create(am.instance,g,{[am.prop]=1}):
Play()end task.delay(g.Time,function()aj.window:DestroySubtree(aj.screenGui)end)end return ae end)()end,[17]=function()
local aa,ab,ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am,an,b,c,d,e,f,g,h=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),60,8
,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},0.9 local i=TweenInfo.new(h,Enum.EasingStyle.Quint,
Enum.EasingDirection.InOut,-1,true)local function j(k:unknown):number?local l=tonumber(k)if l==nil or l~=l or math.abs(l
)==math.huge then return nil end return l end function ae.new(k,l)l=if typeof(l)=='table'then l else{}local m=j(l.steps
or l.Steps)m=if m and m>=2 then math.floor(m)else nil local n=l.range or l.Range local o,p=j(n and n[1])or 0,j(n and n[2
])or m or 1 if o>p then o,p=p,o end local q=setmetatable({tab=assert(k,'Missing argument #1 (Tab expected)'),window=k.
window,name=l.name or l.Name or'Progress',icon=l.icon or l.Icon,description=l.description or l.Description,min=o,max=p,
steps=m,value=0,text=l.text or l.Text,format=l.format or l.Format,showValue=if l.showValue==nil then true else l.
showValue==true,indeterminate=l.indeterminate or l.Indeterminate or false},ae)q.value=q:_clamp(j(l.value or l.Value)or o
)q:_build()if q.description then q.descriptor=ac(ab.Parent.descriptor).new(q.tab,{description=q.description})end return
q end function ae._clamp(k,l:number):number return math.clamp(j(l)or k.min,k.min,k.max)end function ae._ratio(k):number
local l=k.max-k.min if l<=0 then return 1 end return(k.value-k.min)/l end function ae._filledSteps(k):number local l=k.
steps::number return math.clamp(math.round(k:_ratio()*l),0,l)end function ae._readout(k):string if k.text then return aj
.resolve(k.text)end if k.format then local l,m=pcall(k.format,k.value,k.min,k.max)if l and type(m)=='string'then return
m end end if k.steps then return string.format('%d/%d',k:_filledSteps(),k.steps)end return string.format('%d%%',math.
round(k:_ratio()*100))end function ae._build(k)k.main=k.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),
BorderSizePixel=0,Name=k.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k.container=k.window:Create(
'Frame',{Size=UDim2.new(0,170,0,c),Position=UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1
,BorderSizePixel=0,Parent=k.main})k.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection
.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=k.container})if k.icon then k.iconLabel=k.window:Create('ImageLabel',{Image=k.icon,
Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=k.container},{
ImageColor3='ContentColor'})end k.title=k.window:Create('TextLabel',{Text=aj.t(k.name),Size=UDim2.fromOffset(250,c),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=c,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=k.container},{TextColor3='ContentColor',
FontFace='Font'})k.readout=k.window:Create('TextLabel',{Text=k:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-am,0,20),Size=UDim2.fromOffset(50,d),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=
1,TextSize=d,TextXAlignment=Enum.TextXAlignment.Right,Visible=k.showValue,TextTransparency=1,Parent=k.main},{TextColor3=
'ContentColor',FontFace='Font'})if k.steps then k:_buildSteps()return end k.track=k.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0,al),BorderSizePixel=0,BackgroundTransparency
=1,Parent=k.main},{BackgroundColor3='SliderBackground'})k.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.
track})k.fill=k.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.
fromScale(if k.indeterminate then 0 else k:_ratio(),1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
ZIndex=2,BackgroundTransparency=1,Parent=k.track})k.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.fill})
k.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=g,Parent=k.fill},{Color={
'SliderProgress',ah.toColorSequence}})k.fillGlow=k.window:CreateGlow(k.fill,'AccentColor',20,1)if k.indeterminate then k
:_startSweep()end end function ae._buildSteps(k)local l=k.steps::number k.track=k.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,an),BackgroundTransparency=1,BorderSizePixel
=0,Parent=k.main})k.window:Create('UIListLayout',{Padding=UDim.new(0,b),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=k.track})k.stepFrames={}for m=1,l do local n=k.window:Create('Frame',{Size=UDim2.new(1/l,-(
b*(l-1))/l,1,0),BorderSizePixel=0,LayoutOrder=m,BackgroundTransparency=1,Parent=k.track},{BackgroundColor3=
'SliderBackground'})k.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=n})local o=k.window:Create('Frame',{
Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=n})k.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o})k.window:Create('UIGradient',{Rotation=90,
Parent=o},{Color={'SliderProgress',ah.toColorSequence}})table.insert(k.stepFrames,{segment=n,fill=o})end end function ae
._startSweep(k)if k._sweep or k.steps then return end k.fill.AnchorPoint=Vector2.new(0,0.5)k.fill.Position=UDim2.
fromScale(0,0.5)k.fill.Size=UDim2.fromScale(0,1)k._sweep=ag.tweenService:Create(k.fill,i,{Size=UDim2.fromScale(1,1)})k.
_sweep:Play()end function ae._stopSweep(k)if not k._sweep then return end k._sweep:Cancel()k._sweep=nil k.fill.
AnchorPoint=Vector2.new(0,0.5)k.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(k,l:boolean?)k.readout.Text=
k:_readout()if k.steps then if not k._shown then return end local m=k:_filledSteps()for n,o in k.stepFrames do local p=
if n<=m then 0 else 1 if l==false then o.fill.BackgroundTransparency=p else ag.tweenService:Create(o.fill,f,{
BackgroundTransparency=p}):Play()end end return end local m=UDim2.fromScale(k:_ratio(),1)if l==false then k.fill.Size=m
else ag.tweenService:Create(k.fill,f,{Size=m}):Play()end end function ae.Set(k,l)k.value=k:_clamp(l)if k.indeterminate
then k.indeterminate=false k:_stopSweep()end k:_render()end function ae.Get(k):number return k.value end function ae.
GetPercentage(k):number return k:_ratio()end function ae.SetRange(k,l,m)l=j(l)or k.min m=j(m)or k.max if l>m then l,m=m,
l end k.min,k.max=l,m k.value=k:_clamp(k.value)k:_render()end function ae.SetText(k,l)k.text=l k.readout.Text=k:
_readout()end function ae.SetIndeterminate(k,l)l=l==true if l==k.indeterminate then return end k.indeterminate=l if l
then k:_startSweep()else k:_stopSweep()k:_render(false)end end function ae._setShown(k,l,m)local n=k.window k._shown=l n
:_reveal(k.readout,{TextTransparency=if l then e else 1},m)if l then n:_revealCommon(k,m)else n:_hideCommon(k,m)end if k
.steps then local o=k:_filledSteps()for p,q in k.stepFrames do n:_reveal(q.segment,{BackgroundTransparency=if l then 0
else 1},m)n:_reveal(q.fill,{BackgroundTransparency=if l and p<=o then 0 else 1},m)end return end n:_reveal(k.track,{
BackgroundTransparency=if l then 0 else 1},m)n:_reveal(k.fill,{BackgroundTransparency=if l then 0 else 1},m)n:_reveal(k.
fillGlow,{Transparency=if l then n.theme.AccentGlow else 1},m)end function ae.Remove(k)k:_stopSweep()if k.descriptor
then k.descriptor:Remove()end k.main:Destroy()end ai(ae)return ae end)()end,[18]=function()local aa,ab,ac=a(18)local ad
return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),
ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2
local function an(b)if b.__type=='Group'then local c={}local function d(e)for f,g in e.elements do if g.__type=='Group'
then d(g)elseif g.name then table.insert(c,g.name)end end end d(b)return table.concat(c,'\n')end return b.name or''end
local function b(c)local d={}for e,f in c.tabs do if f.neglectSelector then continue end for g,h in f.elements do if h.
__type~='Section'then table.insert(d,h)end end end return d end local function c(d,e,f)af.tweenService:Create(d.
searchPill,f,{BackgroundTransparency=if e then 0.9 else 1}):Play()af.tweenService:Create(d.searchStroke,f,{Transparency=
if e then 0.85 else 1}):Play()af.tweenService:Create(d.searchShadow,f,{Transparency=if e then 0.92 else 1}):Play()af.
tweenService:Create(d.searchIcon,f,{ImageTransparency=if e then 0.65 else 1}):Play()af.tweenService:Create(d.searchInput
,f,{TextTransparency=if e then 0.2 else 1}):Play()end local function d(e,f,g)if e.layout.mode=='sidebar'then return end
for h,i in e.tabs do if not i.neglectSelector and i.topbarItem then i:_applyVisual(if f then(if e.selectedTab==i then
'selected'else'unselected')else'hidden',g)end end end local function e(f,g)g=string.lower(g or'')local h=false for i,j
in f._searchUnits do local k=g==''or string.find(j.text,g,1,true)~=nil j.unit.main.Visible=k if j.unit.descriptor then j
.unit.descriptor.main.Visible=k end h=h or k end f.searchEmpty.Visible=not h and g~=''end local function f(g)g.
_searchUnits={}local h=0 for i,j in b(g)do h+=1 local k=j.main table.insert(g._searchUnits,{unit=j,text=string.lower(an(
j)),homeParent=k.Parent,homeOrder=k.LayoutOrder,descOrder=j.descriptor and j.descriptor.main.LayoutOrder})k.LayoutOrder=
h*10 k.Parent=g.searchPage k.Visible=true if j.descriptor then j.descriptor.main.LayoutOrder=h*10+1 j.descriptor.main.
Parent=g.searchPage j.descriptor.main.Visible=true end end end local function g(h)for i,j in h._searchUnits do local k=j
.unit if k.main and k.main.Parent then k.main.LayoutOrder=j.homeOrder k.main.Parent=j.homeParent k.main.Visible=true end
if k.descriptor and k.descriptor.main and k.descriptor.main.Parent then k.descriptor.main.LayoutOrder=j.descOrder k.
descriptor.main.Parent=j.homeParent k.descriptor.main.Visible=true end end h._searchUnits={}end function aj.open(h)if h.
_searching or h.minimised or not h:_interactive()then return end h._searching=true f(h)e(h,'')h:_jumpTo(h.searchPage)d(h
,false,ak)task.delay(ak.Time,function()if h._searching and h.layout.mode~='sidebar'then h.tabList.Visible=false end end)
h.searchPill.Visible=true c(h,true,ak)h.searchInput:CaptureFocus()af.tweenService:Create(h.searchAction.iconLabel,ak,{
ImageTransparency=am}):Play()end function aj.close(h,i)if not h._searching then return end i=i or{}h._searching=false h.
searchInput.Text=''h.searchInput:ReleaseFocus()h.searchEmpty.Visible=false g(h)local j=if i.jumpTo==nil then h.
selectedTab and h.selectedTab.tabPage else i.jumpTo if j then h:_jumpTo(j)end c(h,false,ak)task.delay(ak.Time,function()
if not h._searching then h.searchPill.Visible=false end end)if i.showTabs then h.tabList.Visible=true d(h,true,ak)end af
.tweenService:Create(h.searchAction.iconLabel,ak,{ImageTransparency=al}):Play()end function aj.toggle(h)if h._searching
then aj.close(h,{showTabs=true})else aj.open(h)end end function aj.railWidth(h,i)if h.searchPill then h.searchPill.Size=
UDim2.new(1,-(i+30),0,35)end end function aj.build(h)h._searching=false h.searchPage=h:Create('ScrollingFrame',{Name=
'Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=h.elements})h:Create('UIListLayout',{Padding=UDim.
new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=h.searchPage})h:Create('UIPadding',{PaddingTop=
UDim.new(0,if h.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=h.searchPage})h.searchEmpty=h
:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,
TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=
UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=h.main},{TextColor3='ContentColor',FontFace='Font'})local i=h.
layout.mode=='sidebar'local j=if i then h.layout.chromeHeight+8 else h.layout.tabStripTop+1 h.searchPill=h:Create(
'Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if i then 1 else 0.5,0),Position=UDim2.new(if i then 1 else 0.5,if i
then-15 else 0,0,j),Size=UDim2.new(1,if i then-(h.layout.railWidth+30)else-35,0,35),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=h.main})h:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=h.searchPill})h.searchStroke=h:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=1,Transparency=1,Parent=h.searchPill})h.searchShadow=h:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=
Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=h.searchPill})h.searchIcon=h:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=UDim2.
fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=h.searchPill},{ImageColor3=
'ContentColor'})h.searchInput=h:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent
=h.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})h:Connect(h.searchInput:
GetPropertyChangedSignal'Text',function()if h._searching then e(h,h.searchInput.Text)end end)h.searchAction=ai.new(h,{
name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(h)end})h.searchAction.isLit=function()return h.
_searching end end return aj end)()end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale)
function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local aj=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or'Section',icon=ai.icon or ai.Icon},ae)
local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{Size=UDim2.new(1,-40,0,20+ak),
BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0 then aj.window:Create('UIPadding'
,{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3='ContentColor'})end aj.title
=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',FontFace='Font'})return aj end function ae._setShown(ah,ai
,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(
ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end end af(ae)return ae end)()end,[20]=function()local aa,ab,
ac=a(20)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,an,b=ac(ae.
variables),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function c(d)return d.layout.mode=='sidebar'and d.profile~=nil and
d.settings.showProfile and af.localPlayer~=nil end local function d(e,f)local g=af.localPlayer if not g then return end
e.profile=e:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.
new(1,0,0,f.footerHeight),BackgroundTransparency=1,Parent=e.sidebar})e.profileContainer=e:Create('Frame',{AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,f.rowInset,0.5,0),Size=UDim2.new(1,-f.rowInset,1,0),BackgroundTransparency=1,
Parent=e.profile})e.profileLayout=e:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=e.profileContainer})e.profileAvatar=e:Create('ImageLabel',{Name='Avatar',Image=ag.
avatar(g.UserId,function(h)if e.profileAvatar and not e.unloaded then ag.assign(e.profileAvatar,'Image',h)end end),Size=
UDim2.fromOffset(f.avatarSize,f.avatarSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=e.profileContainer})e:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=e.profileAvatar})e.profileLabels=e:Create('Frame',{Size=UDim2.fromOffset(50,f.avatarSize),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=e.profileContainer})e:Create('UIListLayout',{Padding=UDim.
new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.profileLabels})e.profileName=e:Create(
'TextLabel',{Text=g.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=e.profileLabels},{TextColor3=
'TitlingColor',FontFace='Font'})e.profileSubtitle=e:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,Visible=false,TextTransparency=1,Parent=e.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end
function ak.build(e,f)e.sidebar=e:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0
,1),Size=UDim2.new(0,f.railWidth,1,-f.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=e.main})e.tabList=e:
Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=e.sidebar})e:Create('UIPadding',{PaddingTop=
UDim.new(0,f.railPadding),PaddingBottom=UDim.new(0,f.railPadding),Parent=e.tabList})e.tabListLayout=e:Create(
'UIListLayout',{Padding=UDim.new(0,f.rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.
tabList})d(e,f)ak.reflowProfile(e)end function ak.reflowProfile(e)local f,g=e.layout,c(e)if e.profile then e.profile.
Visible=g end e.tabList.Size=UDim2.new(1,0,1,if g then-f.footerHeight else 0)end function ak.applyWidth(e,f)local g=e.
layout e.sidebar.Size=UDim2.new(0,f,1,-g.chromeHeight)e.elements.Size=UDim2.new(1,-f,1,-g.chromeHeight)e.bottomFade.Size
=UDim2.new(1,-f,g.fadeSize.Y.Scale,g.fadeSize.Y.Offset)aj.railWidth(e,f)local h=f<(g.railWidth::number)for i,j in e.tabs
do if not j.neglectSelector then ai.setRowCollapsed(j,h,g)end end if e.profileContainer then e.profileContainer.Position
=UDim2.new(0,if h then 0 else g.rowInset,0.5,0)e.profileContainer.Size=UDim2.new(1,if h then 0 else-g.rowInset,1,0)e.
profileLayout.HorizontalAlignment=if h then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left e.
profileLabels.Visible=not h end end function ak.setProfileShown(e,f,g)if not e.profile or not e.profile.Visible then
return end local h={[e.profileAvatar]={ImageTransparency=if f then 0 else 1,BackgroundTransparency=if f then an else 1},
[e.profileName]={TextTransparency=if f then al else 1},[e.profileSubtitle]={TextTransparency=if f then am else 1}}for i,
j in h do if g then af.tweenService:Create(i,g,j):Play()else for k,l in j do i[k]=l end end end end function ak.
setProfileEnabled(e,f)if not e.profile then e.settings.showProfile=f return end if f then e.settings.showProfile=true ak
.reflowProfile(e)ak.setProfileShown(e,true,b)return end ak.setProfileShown(e,false,b)task.delay(b.Time,function()if e.
unloaded or e.settings.showProfile then return end ak.reflowProfile(e)end)e.settings.showProfile=false end function ak.
setSubtitle(e,f)if not e.profileSubtitle then return end local g=if type(f)=='string'and f~=''then ah.resolve(f)else nil
e.profileSubtitle.Text=g or''e.profileSubtitle.Visible=g~=nil end return ak end)()end,[21]=function()local aa,ab,ac=a(21
)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local ag,ah,
ai,aj,ak,al,am,an=ac(af.variables),ac(af.pointer),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af
.locale),ac(af.HapticEngine)local function b(c)local d=0 while d<6 do local e=c*10^d if math.abs(e-math.round(e))<1e-9
then break end d+=1 end return d end local function c(d,e,f)local g=d[1]+math.round((f-d[1])/e)*e return math.clamp(g,d[
1],d[2])end local d,e,f,g,h,i=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(
0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out),300,Vector2.new(35,20),Vector2.new(41,22)local function j(k:number,l:number):UDim2 return UDim2.new(k,math.round(l
*(1-k)),1,0)end local function k():UDim2 return UDim2.new(1,0,0.5,0)end local function l(m:number,n:number,o:number):
number return math.clamp((m-n)/o,0,1)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({
tab=assert(m,'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Slider',icon=n.icon or n.
Icon,description=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.forgetState,range=n.
range or n.Range or{0,100},increment=n.increment or n.Increment or 1,suffix=n.suffix or n.Suffix or'',callback=n.
callback or n.Callback or function()end,dragging=false,minimal=n.minimal or n.Minimal or false,_handleWidth=h.X},ae)
assert(typeof(o.range)=='table'and typeof(o.range[1])=='number'and typeof(o.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if o.range[1]>o.range[2]then o.range={o.range[2],o.range[1]}end if
o.increment<=0 then o.increment=1 end o.value=if(n.value or n.Value)~=nil then(n.value or n.Value)elseif(n.currentValue
or n.CurrentValue)~=nil then(n.currentValue or n.CurrentValue)else o.range[1]o.value=c(o.range,o.increment,o.value)o.
_decimals=b(o.increment)o.flag=n.flag or n.Flag or(not o.forgetState and ai.deriveFlagFromName(o.name)or nil)o.window:
_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o._lastValue=o.value if not o.minimal then o:
_buildLabel()end o.track=o.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='SliderBackground'}
)o.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=o.track})o.progress=o.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=o.track})o.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=o.progress})o.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=o.progress},{Color={
'SliderProgress',ai.toColorSequence}})o.progressGlow=o.window:CreateGlow(o.progress,'AccentColor',20,1)o.handle=o.window
:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=k(),Size=UDim2.fromOffset(h.X,h.Y),BorderSizePixel=0,ZIndex=50,
BackgroundTransparency=1,Parent=o.progress},{BackgroundColor3='SliderHandle'})o.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=o.handle})o.handleGlow=o.window:CreateGlow(o.handle,Color3.fromRGB(255,255,255),10,1)o.handleStroke
=o.window:Create('UIStroke',{Transparency=1,Parent=o.handle},{Color='SliderStroke'})o.interact=o.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=o.track})o.
window:ConnectFor(o,o.main.MouseEnter,function()if not o.window:_interactive()then return end ag.tweenService:Create(o.
track,d,{BackgroundColor3=o.window.theme.SliderBackgroundHover}):Play()end)o.window:ConnectFor(o,o.main.MouseLeave,
function()ag.tweenService:Create(o.track,d,{BackgroundColor3=o.window.theme.SliderBackground}):Play()end)o.window:
ConnectFor(o,o.interact.InputBegan,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==
Enum.UserInputType.Touch then an.click()o._dragInput=p o.dragging=true o:_setHeld(true)o:_updateFromMouse()if o.
_dragConnection then o._dragConnection:Disconnect()o._dragConnection=nil end o._dragConnection=ag.runService.
RenderStepped:Connect(function()if o.window.unloaded or not o.dragging then if o._dragConnection then o._dragConnection:
Disconnect()o._dragConnection=nil end return end o:_updateFromMouse()end)end end)o.window:ConnectFor(o,ag.
userInputService.InputEnded,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.
UserInputType.Touch then o:_endDrag()end end)o.window:ConnectFor(o,ag.userInputService.WindowFocusReleased,function()o:
_endDrag()end)if o.description and not o.minimal then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.
description})end o.window:ConnectFor(o,o.main:GetPropertyChangedSignal'AbsoluteSize',function()if o.window.animating or(
o.window.hidden and o.window.hasShownOnce)then return end o:_applyLayout()end)o:_applyLayout()if o.minimal then o.main.
Size=UDim2.new(1,-20,0,41)o.track.AnchorPoint=Vector2.new(0.5,0.5)o.track.Position=UDim2.new(0.5,0,0.5,0)o.track.Size=
UDim2.new(1,-30,0,14)end o:_renderProgress()return o end function ae._buildLabel(m)m.container=m.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=m.main})m.containerLayout=m.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.container})m.
titleContainer=m.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=m.container})m.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.titleContainer})m.
titleFlex=m.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=m.titleContainer})if m.icon then m.
iconLabel=m.window:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=m.titleContainer},{ImageColor3='ContentColor'})end m.title=
m.window:Create('TextLabel',{Text=am.t(m.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=m.titleContainer},{TextColor3='ContentColor',FontFace='Font'})m.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=m.title})m.valueHost=m.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=m.container})m.valueOdo=aj.new(m.window,m.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})m.valueOdo:snap(m:_format(m
.value))end function ae._setMainHeight(m,n)if m._widthManaged then m.main.Size=UDim2.new(m.main.Size.X.Scale,m.main.Size
.X.Offset,0,n)else m.main.Size=UDim2.new(1,-20,0,n)end end function ae._applyLayout(m)if m.minimal then return end local
n=m.main.AbsoluteSize.X/m.window.scale local o=if n>0 and n<g then'narrow'else'wide'if m._layoutMode==o then return end
m._layoutMode=o if o=='narrow'then m:_setMainHeight(70)m.container.AnchorPoint=Vector2.new(0,0)m.container.Position=
UDim2.new(0,20,0,14)m.container.Size=UDim2.new(1,-40,0,16)m.containerLayout.FillDirection=Enum.FillDirection.Horizontal
m.titleFlex.FlexMode=Enum.UIFlexMode.Fill m.valueHost.AutomaticSize=Enum.AutomaticSize.X m.valueHost.Size=UDim2.new(0,0,
0,16)m.track.AnchorPoint=Vector2.new(0.5,1)m.track.Position=UDim2.new(0.5,0,1,-14)m.track.Size=UDim2.new(1,-30,0,14)else
m:_setMainHeight(65)m.container.AnchorPoint=Vector2.new(0,0.5)m.container.Position=UDim2.new(0,20,0.5,0)m.container.Size
=UDim2.new(0,170,0,33)m.containerLayout.FillDirection=Enum.FillDirection.Vertical m.titleFlex.FlexMode=Enum.UIFlexMode.
None m.valueHost.AutomaticSize=Enum.AutomaticSize.None m.valueHost.Size=UDim2.new(1,0,0,16)m.track.AnchorPoint=Vector2.
new(1,0.5)m.track.Position=UDim2.new(1,-15,0.5,0)m.track.Size=UDim2.new(0,222,0,14)end end function ae._format(m,n)local
o=string.format('%.'..m._decimals..'f',n)if m.suffix~=''then return o..' '..m.suffix end return o end function ae.
_pillTravel(m)return math.max(m.track.AbsoluteSize.X-m._handleWidth*m.window.scale,0)end function ae._renderProgress(m,n
)local o=m.range[2]-m.range[1]local p=if o~=0 then math.clamp((m.value-m.range[1])/o,0,1)else 0 local q=j(p,m.
_handleWidth)if n then ag.tweenService:Create(m.progress,n,{Size=q}):Play()else m.progress.Size=q end end function ae.
_updateFromMouse(m)local n=m:_pillTravel()if n<=0 then return end local o=l(ah.location(m._dragInput).X,m.track.
AbsolutePosition.X+m._handleWidth*m.window.scale/2,n)local p=c(m.range,m.increment,m.range[1]+o*(m.range[2]-m.range[1]))
if p~=m.value then m.value=p if m.valueOdo then m.valueOdo:snap(m:_format(p))end m._lastValue=p m:_renderProgress(f)m:
_fireCallback(p)end end function ae._endDrag(m)if not m.dragging then return end m.dragging=false m:_setHeld(false)if m.
_dragConnection then m._dragConnection:Disconnect()m._dragConnection=nil end m.window:_persist(m)end function ae.
_setHeld(m,n)if not n then m:_fireCallback(m.value)end local o=if n then i else h m._handleWidth=o.X ag.tweenService:
Create(m.handle,e,{Size=UDim2.fromOffset(o.X,o.Y),BackgroundTransparency=if n then 0.7 else 0}):Play()ag.tweenService:
Create(m.handleStroke,e,{Transparency=if n then 0.6 else 1}):Play()m:_renderProgress(e)end function ae._fireCallback(m,n
)m.window:_runGuarded(m,m.callback,n,m.dragging==true)end function ae.Set(m,n,o)n=c(m.range,m.increment,n)m.value=n if m
.valueOdo then m.valueOdo:to(m:_format(n),n>=(m._lastValue or n))end m._lastValue=n m:_renderProgress(d)if not o then m:
_fireCallback(n)m.window:_persist(m)end end local m=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out,0,false,0.35)function ae._setShown(n,o,p)local q=n.window if o then q:_revealCommon(n,p)q:_reveal(n.track,{
BackgroundTransparency=0},p)q:_reveal(n.progress,{BackgroundTransparency=0},p)q:_reveal(n.handle,{BackgroundTransparency
=0},p)if n.valueOdo then n.valueOdo:reveal(0.3,p)end q:_reveal(n.progressGlow,{Transparency=math.max(0.55,q.theme.
AccentGlow)},p,m)q:_reveal(n.handleGlow,{Transparency=0.8},p,m)else q:_hideCommon(n,p)q:_reveal(n.track,{
BackgroundTransparency=1},p)q:_reveal(n.progress,{BackgroundTransparency=1},p)q:_reveal(n.handle,{BackgroundTransparency
=1},p)if n.valueOdo then n.valueOdo:reveal(1,p)end q:_reveal(n.progressGlow,{Transparency=1},p,m)q:_reveal(n.handleGlow,
{Transparency=1},p,m)end end function ae._refreshTheme(n)ag.tweenService:Create(n.progressGlow,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=math.max(0.55,n.window.theme.AccentGlow)}):Play()end function
ae._minWidth(n)if n.minimal then return 100 end local o=40 if n.icon then o+=22 end o+=ai.textWidth(n.window.theme.Font,
16,am.resolve(n.name))o+=12 o+=ai.textWidth(n.window.theme.Font,15,n:_format(n.value))return math.max(o,160)end ak(ae)
al(ae)return ae end)()end,[22]=function()local aa,ab,ac=a(22)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Statistic'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.
odometer),ac(af.moveable),ac(af.constants),ac(af.locale),ac(af.log)local an,b,c,d=ak.statAccents,NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)
local function e(f)return f.fill.Keypoints[1].Value end local function f(g)if g>0 then return string.format('+%.1f%%',g)
elseif g<0 then return string.format('%.1f%%',g)else return'0%'end end local function g(h)if typeof(h)~='number'then
return tostring(h)end local i=math.round(math.abs(h))local j=string.format('%.0f',i)local k=j:reverse():gsub('%d%d%d',
'%0,'):reverse()if k:sub(1,1)==','then k=k:sub(2)end return if h<0 and i~=0 then'-'..k else k end local function h(i)
local j=math.round(i)if j>0 then return'+'..g(j)elseif j<0 then return g(j)else return'0'end end function ae.new(i,j)j=
if typeof(j)=='table'then j else{}local k=setmetatable({tab=assert(i,'Missing argument #1 (Tab expected)'),window=i.
window,name=j.name or j.Name or'Statistic',icon=j.icon or j.Icon,description=j.description or j.Description,value=if(j.
value or j.Value)~=nil then(j.value or j.Value)else 0,_hasValue=(j.value or j.Value)~=nil,numberEasing=if(j.numberEasing
~=nil)then j.numberEasing elseif j.NumberEasing~=nil then j.NumberEasing else true,changeMode=j.changeMode or j.
ChangeMode or'percentage',changeBaseline=j.changeBaseline or j.ChangeBaseline or'previous',prefix=j.prefix or j.Prefix
or'',suffix=j.suffix or j.Suffix or'',compact=j.compact or j.Compact or i.compact or false,display=(j.display or j.
Display or'value'),_initialValue=if(j.value or j.Value)~=nil then(j.value or j.Value)else nil,_lastChange=0},ae)if k.
compact then k:_buildCompact()else k:_buildFull()end if k.description then if k.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
k.name}'.`)else k.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})end end return k end
function ae._buildFull(i)local j=i.window i.main=j:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=i.
name,ZIndex=5,BackgroundTransparency=1,Parent=i.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})j:Create('UICorner',{Parent=i.main},{CornerRadius='ElementCornerRadius'})i.stroke=j:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=i.main},{Transparency='ElementStrokeTransparency'})i
.strokeGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.stroke,Transparency=b,
Parent=i.stroke})i.titleContainer=j:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=i.main})i.gradientContainer=j:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=i.main})i.glow=j:CreateGlow(i.main,e(an.neutral),13,1)i.title=j:Create(
'TextLabel',{Text=al.t(i.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=i.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})i.mainGradient=j:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=b,Parent=i.gradientContainer})j:Create('UICorner',{Parent=i.
gradientContainer},{CornerRadius='ElementCornerRadius'})if i.icon then i.iconLabel=j:Create('ImageLabel',{Image=i.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=i.
titleContainer},{ImageColor3='ContentColor'})end i.containerLayout=j:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.titleContainer})i.valueHost=j:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=i.main})i.changeHost=j:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=i.main})i.
valueOdo=ai.new(j,i.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})i.valueOdo:snap(i:
_formatValue(i.value))i.changeOdo=ai.new(j,i.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})i.changeOdo:snap(i:_formatChange(0))i._accentGradients={i.strokeGradient,i.mainGradient}end function ae.
_buildCompact(i)local j,k=i.window,i.tab.compact or false i.main=j:Create('Frame',{Name=i.name,Size=if k then UDim2.
fromOffset(0,c)else UDim2.new(1,-20,0,c),AutomaticSize=if k then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=i.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})j:Create('UICorner',{Parent=i.main},{CornerRadius=
'ElementCornerRadius'})i.stroke=j:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=i.main},{
Transparency='ElementStrokeTransparency'})i.strokeGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=an.neutral.stroke,Transparency=b,Parent=i.stroke})if k then j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=i.main})end j:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=i.main})i.card=j:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,c),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=i.main})j:Create('UICorner',{Parent=i.card},{CornerRadius='ElementCornerRadius'})i.
mainGradient=j:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=an.neutral.fill,Transparency=b,Parent=i.
card})j:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=i.card})j:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=i.card})i.titleContainer=j:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=i.card})j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=i.titleContainer})j:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i
.titleContainer})if i.icon then i.iconLabel=j:Create('ImageLabel',{Image=i.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=i.titleContainer},{
ImageColor3='ContentColor'})end i.title=j:Create('TextLabel',{Text=al.t(i.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=i.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})j:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=i.title})i.readoutHost=j:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=i.card})i.readoutOdo=ai.new(j,i.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})i.readoutOdo:snap(i.display=='change'and i:
_formatChange(0)or i:_formatValue(i.value))i._accentGradients={i.strokeGradient,i.mainGradient}end function ae.
_setAccent(i,j,k)local l=an[j]i.strokeGradient.Color=l.stroke i.mainGradient.Color=l.fill if i.glow then i.glow.Color=e(
l)end local m,n=if k==1 then 14 elseif k==-1 then-10 else 2,if k==1 then Vector2.new(0.04,0.5)elseif k==-1 then Vector2.
new(-4E-2,0.5)else Vector2.new(0,0.5)for o,p in i._accentGradients do ag.tweenService:Create(p,d,{Rotation=m,Offset=n}):
Play()end end function ae._formatValue(i,j)return i.prefix..g(j)..i.suffix end function ae._formatChange(i,j)if i.
changeMode=='absolute'then return h(j)else return f(j)end end function ae._showValue(i,j,k,l,m)if i.numberEasing and not
m then j:to(i:_formatValue(k),k>=l)else j:snap(i:_formatValue(k))end end function ae._updateFullReadouts(i,j,k,l,m,n,o)i
:_showValue(i.valueOdo,j,k,o)if n then i.changeOdo:snap(n)i._lastChange=0 elseif i.numberEasing and not m then i.
changeOdo:to(i:_formatChange(l),l>=i._lastChange)i._lastChange=l else i.changeOdo:snap(i:_formatChange(l or 0))i.
_lastChange=l or 0 end end function ae._updateCompactReadout(i,j,k,l,m,n,o)if i.display=='change'then if n then i.
readoutOdo:snap(n)i._lastChange=0 elseif i.numberEasing and not m then i.readoutOdo:to(i:_formatChange(l),l>=i.
_lastChange)i._lastChange=l else i.readoutOdo:snap(i:_formatChange(l or 0))i._lastChange=l or 0 end else i:_showValue(i.
readoutOdo,j,k,o)end end function ae.Set(i,j)assert(typeof(j)=='number','Statistic:Set() - value must be a number, got '
..typeof(j))local k,l=i.value,not i._hasValue i.value=j i._hasValue=true if l then i._initialValue=j end local m=if i.
changeBaseline=='initial'then i._initialValue else k local n,o,p,q,r=l or m==j if n then o=0 q='neutral'r=0 elseif m==0
then local s,t=if j>0 then'+'else'-',if i.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'p=s..t q=if j>0 then
'positive'else'negative'r=if j>0 then 1 else-1 elseif i.changeMode=='percentage'then o=((j-m)/math.abs(m))*100 r=if o>0
then 1 elseif o<0 then-1 else 0 q=if r==1 then'positive'elseif r==-1 then'negative'else'neutral'else o=j-m r=if o>0 then
1 elseif o<0 then-1 else 0 q=if r==1 then'positive'elseif r==-1 then'negative'else'neutral'end i:_setAccent(q,r)if i.
compact then i:_updateCompactReadout(j,k,o,n,p,l)else i:_updateFullReadouts(j,k,o,n,p,l)end end function ae.
ResetBaseline(i,j)local k,l,m=i.value,not i._hasValue,if typeof(j)=='number'then j else i.value i._initialValue=m i.
value=m i._hasValue=true i._lastChange=0 if i.compact then if i.display=='change'then i.readoutOdo:snap(i:_formatChange(
0))else i:_showValue(i.readoutOdo,m,k,l)end else i.changeOdo:snap(i:_formatChange(0))i:_showValue(i.valueOdo,m,k,l)end i
:_setAccent('neutral',0)end function ae._setShown(i,j,k)local l=i.window if i.compact then l:_reveal(i.main,{
BackgroundTransparency=if j then(i.window.theme.ElementTransparency or 0)else 1},k)l:_reveal(i.stroke,{Transparency=if j
then i.window.theme.ElementStrokeTransparency else 1},k)l:_reveal(i.card,{BackgroundTransparency=if j then 0 else 1},k)l
:_reveal(i.title,{TextTransparency=if j then 0 else 1},k)if i.iconLabel then l:_reveal(i.iconLabel,{ImageTransparency=if
j then 0 else 1},k)end i.readoutOdo:reveal(if j then 0 else 1,k)return end if j then l:_revealCommon(i,k)l:_reveal(i.
gradientContainer,{BackgroundTransparency=0},k)l:_reveal(i.glow,{Transparency=0.82},k)i.valueOdo:reveal(0,k)i.changeOdo:
reveal(0,k)else l:_hideCommon(i,k)l:_reveal(i.gradientContainer,{BackgroundTransparency=1},k)l:_reveal(i.glow,{
Transparency=1},k)i.valueOdo:reveal(1,k)i.changeOdo:reveal(1,k)end end function ae._minWidth(i)local j=40 if i.icon then
j+=26 end j+=ah.textWidth(i.window.theme.Font,16,al.resolve(i.name))local k=if i.display=='change'then i:_formatChange(0
)else i:_formatValue(i.value)j+=ah.textWidth(i.window.theme.Font,17,k)return j end aj(ae)return ae end)()end,[23]=
function()local aa,ab,ac=a(23)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.ordering),ac(af.HapticEngine),ac(ab.Parent.search),ac(ab.
Parent.tabSelector)local function al(am,an)for b,c in an do if c.__type=='Group'then al(am,c.elements)else am:
_unregisterControl(c)end if c.connections then for d,e in c.connections do am:Disconnect(e)end c.connections=nil end if
c._dragConnection then c._dragConnection:Disconnect()c._dragConnection=nil end if am._recordingKeybind==c then am.
_recordingKeybind=nil end if c._outsideClickConn then am:Disconnect(c._outsideClickConn)c._outsideClickConn=nil end end
end local am,an=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)function ae.new(b,c)c=if typeof(c)=='table'then c else{}local d=setmetatable({window=
assert(b,'Missing argument #1 (Window expected)'),name=c.name or c.Name,icon=c.icon or c.Icon,neglectSelector=c.
neglectSelector or c.NeglectSelector or false,customOrder=c.customOrder or c.CustomOrder or 0,builtIn=c.builtIn or false
,keepSelection=c.keepSelection or false,forgetState=c.forgetState or c.ForgetState or false,elements={},connections={}},
ae)assert(d.name or d.icon,'A tab needs a name or an icon.')if not d.neglectSelector then ak.build(d,d.window.layout)end
d.tabPage=d.window:Create('ScrollingFrame',{Name=d.name,Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),
AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=d.
customOrder or 0,Parent=d.window.elements})d.tabPageLayout=d.window:Create('UIListLayout',{Padding=UDim.new(0,7),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=d.tabPage})d.window:Create('UIPadding',{
PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=d.tabPage})if not d.neglectSelector then table.insert(d.
connections,d.window:Connect(d.topbarItemInteract.MouseButton1Click,function()ai.click()d:Select()end))table.insert(d.
connections,d.window:Connect(d.topbarItemInteract.MouseEnter,function()if not d.window:_interactive()then return end if
d.window.selectedTab~=d then d:_applyVisual('hover',an)d:_spinGradients()end end))table.insert(d.connections,d.window:
Connect(d.topbarItemInteract.MouseLeave,function()if d.window.selectedTab~=d then d:_applyVisual('unselected',an)end end
))end return d end function ae._applyVisual(b,c,d)if b.neglectSelector or not b.topbarItem then return end local e=ak.
states[b.window.layout.mode][c]if not e then return end ak.applyVisual(b,e,d)end function ae._spinGradients(b)if b.
neglectSelector then return end local c=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)for d,e in{b.
topbarItemGradient,b.topbarItemStrokeGradient}do e.Rotation=-270 ag.tweenService:Create(e,c,{Rotation=90}):Play()end end
function ae.Select(b,c)if b.window._searching then aj.close(b.window,{showTabs=true,jumpTo=false})end b.window.
selectedTab=b b.window:_jumpTo(b.tabPage)local d=c or not b.window:_interactive()if not b.neglectSelector and not d then
b:_applyVisual('selected',am)end for e,f in b.window.tabs do if f~=b.window.selectedTab then f:Deselect(d)end end if b~=
b.window.rfSettings and b.window.settingsAction and not d then ag.tweenService:Create(b.window.settingsAction.iconLabel,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end function ae.
Deselect(b,c)if not b.neglectSelector and not c then b:_applyVisual('unselected',am)end end function ae._register(b,c)
table.insert(b.elements,c)ah(c,#b.elements*10)b.window:_restoreLate(c)if not b.window.hidden then c:_setShown(true,true)
end return c end function ae.CreateButton(b,c)return b:_register(ac(ab.Parent.button).new(b,c))end function ae.
CreateToggle(b,c)return b:_register(ac(ab.Parent.toggle).new(b,c))end function ae.CreateSwitch(b,c)return b:
CreateToggle(c)end function ae.CreateSection(b,c)return b:_register(ac(ab.Parent.section).new(b,c))end function ae.
CreateText(b,c)return b:_register(ac(ab.Parent.text).new(b,c))end function ae.CreateDivider(b,c)return b:_register(ac(ab
.Parent.divider).new(b,c))end function ae.CreateProgress(b,c)return b:_register(ac(ab.Parent.progress).new(b,c))end
function ae.CreateConsole(b,c)return b:_register(ac(ab.Parent.console).new(b,c))end function ae.CreateStat(b,c)return b:
_register(ac(ab.Parent.stat).new(b,c))end function ae.CreateSlider(b,c)return b:_register(ac(ab.Parent.slider).new(b,c))
end function ae.CreateDropdown(b,c)return b:_register(ac(ab.Parent.dropdown).new(b,c))end function ae.CreateInput(b,c)
return b:_register(ac(ab.Parent.input).new(b,c))end function ae.CreateKeybind(b,c)return b:_register(ac(ab.Parent.
keybind).new(b,c))end function ae.CreateColorPicker(b,c)return b:_register(ac(ab.Parent.colorpicker).new(b,c))end
function ae.CreateGroup(b,c)return b:_register(ac(ab.Parent.group).new(b,c))end function ae._moveElement(b,c,d)local e=
table.find(b.elements,c)if not e then return end table.remove(b.elements,e)d=math.clamp(d,1,#b.elements+1)table.insert(b
.elements,d,c)for f,g in b.elements do ah(g,f*10)end end function ae.Remove(b)local c=b.window if c._searching then aj.
close(c,{showTabs=true,jumpTo=c.selectedTab and c.selectedTab.tabPage})end local d=table.find(c.tabs,b)if d then table.
remove(c.tabs,d)end if c.selectedTab==b then c.selectedTab=nil for e,f in ipairs(c.tabs)do if not f.neglectSelector then
f:Select()break end end end al(c,b.elements)for e,f in b.connections do c:Disconnect(f)end b.connections={}if b.
topbarItem then c:DestroySubtree(b.topbarItem)end if b.tabPage then c:DestroySubtree(b.tabPage)end b.topbarItem=nil b.
tabPage=nil b.elements={}end return ae end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local
ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(ab.Parent.Parent.
utility.log),20,6,3 local function ak(al)for am,an in al.tabs do if not an.neglectSelector and not an.builtIn then
return true end end return#al.tabSections>0 end function ae.new(al,am)am=if typeof(am)=='table'then am else{}local an=
setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),name=am.name or am.Name or'Section',icon=am.icon
or am.Icon},ae)if al.layout.mode~='sidebar'then if not al._warnedTabSection then al._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end an.inert=true return
an end an.main=al:Create('Frame',{Name=an.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=al.tabList})an.padding=al:Create('UIPadding',{PaddingTop
=UDim.new(0,if ak(al)then ai else 0),PaddingBottom=UDim.new(0,aj),Parent=an.main})al:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=an.main})if an.
icon then an.iconLabel=al:Create('ImageLabel',{Image=an.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=0,ImageTransparency=1,Parent=an.main},{ImageColor3='ContentColor'})end an.title=al:Create(
'TextLabel',{Text=af.t(an.name),Size=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=an.main},{TextColor3='ContentColor',FontFace='Font'})return an
end function ae._setShown(al,am,an)if not al.main then return end local b=al.window b:_reveal(al.title,{TextTransparency
=if am then 0.6 else 1},an)if al.iconLabel then b:_reveal(al.iconLabel,{ImageTransparency=if am then 0.65 else 1},an)end
end function ae._setVisible(al,am)if al.main then al.main.Visible=am end end function ae.Remove(al)local am=table.find(
al.window.tabSections,al)if am then table.remove(al.window.tabSections,am)end al.window:DestroySubtree(al.main)al.main=
nil end return ae end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.Parent.Parent.
utility local af,ag,ah,ai=ac(ae.variables),ac(ae.functions),ac(ae.locale),{}local function aj(ak:string?):string if
type(ak)~='string'or ak==''then return'?'end local al=utf8.offset(ak,2)local am=if al then string.sub(ak,1,al-1)else ak
return string.upper(am)end ai.states={top={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=0.3,
content=0.3},unselected={background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},sidebar={
selected={background=0.4,stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},
unselected={background=1,stroke=1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,shadow=1}}}
local function ak(al,am,an)al.topbarItemGradient=al.window:Create('UIGradient',{Rotation=90,Parent=am},{Color={
'TabBackground',ag.toColorSequence}})al.topbarItemStrokeGradient=al.window:Create('UIGradient',{Rotation=90,Parent=an},{
Color={'TabStroke',ag.toColorSequence}})end local function al(am,an,b)if b and not am.icon then am.topbarItemInitial=am.
window:Create('TextLabel',{Text=aj(am.name),Size=UDim2.fromOffset(an,an),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=an-4,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,
TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if am.icon then am.
topbarItemIcon=am.window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(an,an),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=am.topbarItemContainer},{ImageColor3='TabColor'})end if am.name then
am.topbarItemTitle=am.window:Create('TextLabel',{Text=ah.t(am.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'}
)end end local function am(an)an.topbarItem=an.window:Create('Frame',{Name=an.name,Size=UDim2.fromOffset(0,34),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency
=1,Visible=false,LayoutOrder=an.customOrder or 0,Parent=an.window.tabList})an.topbarItemInteract=an.window:Create(
'TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency
=1,Parent=an.topbarItem})an.window:Create('UICorner',{Parent=an.topbarItem},{CornerRadius='PillCornerRadius'})an.
topbarItemStroke=an.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,
255),Transparency=1,Parent=an.topbarItem})ak(an,an.topbarItem,an.topbarItemStroke)an.topbarItemContainer=an.window:
Create('Frame',{Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=
0,Parent=an.topbarItem})an.window:Create('UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=an.
topbarItemContainer})an.topbarItemLayout=an.window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.topbarItemContainer})al(an,16,false)end local function an(b,c)b.
topbarItem=b.window:Create('Frame',{Name=b.name,Size=UDim2.new(1,-c.rowInset*2,0,c.rowHeight),BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=b.customOrder or 0,Parent=b.
window.tabList})b.topbarItemInteract=b.window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=b.topbarItem})b.window:Create('UICorner',{
CornerRadius=UDim.new(0,c.rowCornerRadius),Parent=b.topbarItem})b.topbarItemStroke=b.window:Create('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=b.topbarItem})ak(b,b
.topbarItem,b.topbarItemStroke)b.topbarItemShadow=b.window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.
fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=b.
topbarItem})b.topbarItemContainer=b.window:Create('Frame',{Size=UDim2.new(1,-c.rowPadding,0,24),Position=UDim2.new(0,c.
rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=b.topbarItem})b.
topbarItemLayout=b.window:Create('UIListLayout',{Padding=UDim.new(0,c.rowContentSpacing),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.topbarItemContainer})al(b,c.rowIconSize,true)end function ai.build(b,
c)if c.mode=='sidebar'then an(b,c)else am(b)end end function ai.setRowCollapsed(b,c,d)if d.mode~='sidebar'or not b.
topbarItem then return end if b.topbarItemTitle then b.topbarItemTitle.Visible=not c end if b.topbarItemInitial then b.
topbarItemInitial.Visible=c end local e=if c then 0 else d.rowPadding b.topbarItemContainer.Size=UDim2.new(1,-e,0,24)b.
topbarItemContainer.Position=UDim2.new(0,e,0.5,0)b.topbarItemLayout.HorizontalAlignment=if c then Enum.
HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end function ai.applyVisual(b,c,d)local e={[b.topbarItem]=
{BackgroundTransparency=c.background},[b.topbarItemStroke]={Transparency=c.stroke}}if b.topbarItemIcon then e[b.
topbarItemIcon]={ImageTransparency=c.content}end if b.topbarItemTitle then e[b.topbarItemTitle]={TextTransparency=c.
content}end if b.topbarItemInitial then e[b.topbarItemInitial]={TextTransparency=c.content}end if b.topbarItemShadow and
c.shadow then e[b.topbarItemShadow]={Transparency=c.shadow}end for f,g in e do if d then af.tweenService:Create(f,d,g):
Play()else for h,i in g do f[h]=i end end end end return ai end)()end,[26]=function()local aa,ab,ac=a(26)local ad return
(function(...)local ae={}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.
variables),ac(af.functions),ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)function ae.new(al,am)am=if typeof(am)=='table'then am else{}local an=setmetatable({window=assert(al
,'Missing argument #1 (Window expected)'),text=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=
am.color or am.Color or aj},ae)assert(an.icon or(an.text and an.text~=''),'A Tag requires an icon, text, or both.')an.
main=an.window:Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=an.color,BorderSizePixel=0,LayoutOrder=am.order or am.Order or 0,BackgroundTransparency=1,Parent=an.
window.tagContainer})an.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=an.main})an.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=an.main})an.window:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=an.main})local b=ah.contrastColor(an.color)an.iconLabel=an.window:Create(
'ImageLabel',{Name='Icon',Image=an.icon or'',ImageColor3=b,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible
=an.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=an.main})an.title=an.window:Create('TextLabel',{Name='Title',
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,
Text=an.text or'',TextColor3=b,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,
Visible=an.text~=nil and an.text~='',LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=an.main},{FontFace='Font'})an.
window.tagContainer.Visible=true if not an.window.hidden then an:_setShown(true,ak)end return an end function ae.
_setShown(al,am,an)local b,c=if am then 0 else 1,if typeof(an)=='TweenInfo'then an elseif an then ak else nil if c then
ag.tweenService:Create(al.main,c,{BackgroundTransparency=b}):Play()ag.tweenService:Create(al.iconLabel,c,{
ImageTransparency=b}):Play()ag.tweenService:Create(al.title,c,{TextTransparency=b}):Play()else al.main.
BackgroundTransparency=b al.iconLabel.ImageTransparency=b al.title.TextTransparency=b end end function ae.SetColor(al,am
)al.color=am local an=ah.contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=am}):Play()ag.tweenService
:Create(al.iconLabel,ak,{ImageColor3=an}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=an}):Play()end function
ae.SetText(al,am)al.text=am al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function ae.SetIcon(al,am)al.
icon=am ai.assign(al.iconLabel,'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if am.color or am.Color
then al:SetColor(am.color or am.Color)end if am.text or am.Text or am.title or am.Title then al:SetText(am.text or am.
Text or am.title or am.Title)end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.Icon)end end function ae.
Remove(al)al.window:DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then table.remove(al.window.tags,
am)end if#al.window.tags==0 then al.window.tagContainer.Visible=false end end return ae end)()end,[27]=function()local
aa,ab,ac=a(27)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,aj=ac(ab.Parent.
Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(ak,al)al=if typeof(al)=='table'
then al else{}local am=setmetatable({tab=assert(ak,'Missing argument #1 (Tab expected)'),window=ak.window,name=tostring(
al.name or al.Name or''),text=tostring(al.text or al.Text or''),icon=al.icon or al.Icon},ae)am.main=am.window:Create(
'Frame',{Size=UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if am.name~=''then am.name
else'Text',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})am.stroke=am.window:StyleElementBody(am.main)am.window:Create('UIPadding',
{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=am
.main})am.window:Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=am.main})am.
titleRow=am.window:Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=1,Parent=am.main})am.window:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.
VerticalAlignment.Top,Parent=am.titleRow})if am.icon then am.iconLabel=am.window:Create('ImageLabel',{Image=am.icon,Size
=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.titleRow},{ImageColor3
='ContentColor'})end am.title=am.window:Create('TextLabel',{Text=ag.t(am.name),Size=UDim2.new(1,if am.icon then-22 else
0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ah,
TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,Parent=am.titleRow},{
TextColor3='TitlingColor',FontFace='Font'})am.body=am.window:Create('TextLabel',{Text=ag.t(am.text),Size=UDim2.new(1,0,0
,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=
true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=am.main},{TextColor3='ContentColor'
,FontFace='Font'})am:_applyPresence()return am end function ae._applyPresence(ak)ak.titleRow.Visible=ak.name~=''or ak.
icon~=nil ak.body.Visible=ak.text~=''end function ae.Set(ak,al)ak.text=tostring(al)ak.window:_bindLocale(ak.body,'Text',
ak.text)ak:_applyPresence()end function ae.SetTitle(ak,al)ak.name=tostring(al)ak.window:_bindLocale(ak.title,'Text',ak.
name)ak:_applyPresence()end function ae._setShown(ak,al,am)if al then ak.window:_revealCommon(ak,am)else ak.window:
_hideCommon(ak,am)end ak.window:_reveal(ak.body,{TextTransparency=if al then aj else 1},am)end af(ae)return ae end)()end
,[28]=function()local aa,ab,ac=a(28)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.
Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,an,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q=ac(af.variables),ac(af.functions),
ac(af.constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo
.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-
180),UDim2.new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function r(s)return math.clamp(#s*0.06+3,3,9)end
local function s(t)if type(t)=='number'then return'rbxassetid://'..tostring(t)end return t end function ae.new(t,u,v)u=
if typeof(u)=='table'then u else{}local w=setmetatable({window=assert(t,'Missing argument #1 (Window expected)'),title=u
.title or u.Title or'',subtitle=u.subtitle or u.Subtitle,icon=u.icon or u.Icon,avatar=u.avatar or u.Avatar,minWidth=u.
minWidth or u.MinWidth,subtitleAbove=u.subtitleAbove or u.SubtitleAbove or false,position=u.position or'Top',_hovered=
false,_dismissed=false},ae)w.duration=u.duration or u.Duration or r(w.title..(w.subtitle or''))local x=w.avatar~=nil and
w.avatar~=0 local y=x or(w.icon~=nil and w.icon~=0 and w.icon~='')w._iconImage=if x then aj.avatar(w.avatar,function(z)
if w.iconLabel and not w._dismissed and w.main.Parent then aj.assign(w.iconLabel,'Image',z)end end)elseif y then s(w.
icon)else nil w._iconSize=if x then e else d w._leftPad=if x then h else f w._rightPad=if x then i else g w._minWidth=
math.clamp(w.minWidth or 0,l,m)local z=w.subtitle~=nil and w.subtitle~=''w.main=w.window:Create('Frame',{Name='Toast',
BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=v or w.window.toasts})w
.window:Create('UIPadding',{PaddingTop=UDim.new(0,k),Parent=w.main})w.body=w.window:Create('Frame',{BackgroundColor3=
Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=if w.position=='Bottom'then p else o,AnchorPoint=Vector2.
new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=w.main})w.window:
Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=w.body},{Color={'WindowColor',ah.toColorSequence}})w
.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=w.body})w.stroke=w.window:Create('UIStroke',{Transparency=1
,Parent=w.body},{Color='SurfaceStroke'})w.shadow=w.window:CreateGlow(w.body,'ShadowColor',20,1)w.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,w._leftPad),PaddingRight=UDim.new(0,w._rightPad),Parent=w.body})w.window:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,j),Parent=w.
body})if y then w.iconLabel=w.window:Create('ImageLabel',{Image=w._iconImage,Size=UDim2.fromOffset(w._iconSize,w.
_iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,
BackgroundTransparency=1,ImageTransparency=1,Parent=w.body},if x then nil else{ImageColor3='ContentColor'})w.window:
Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=w.iconLabel})end w.container=w.window:Create('Frame',{AutomaticSize
=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,z and 32 or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,
ZIndex=ai.zIndex.toastContent,Parent=w.body})w.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=w.
container})w.titleLabel=w.window:Create('TextLabel',{Text=w.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,16),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if w.
subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=w.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if z then w.subtitleLabel=w.window:Create('TextLabel',{Text=w.subtitle,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=if w.subtitleAbove then 1 else 2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent
=w.container},{TextColor3='ContentColor',FontFace='Font'})end w.window._toastCount=(w.window._toastCount or 0)+1 w.main.
LayoutOrder=-w.window._toastCount local A=w.window._liveToasts if not A then A={}w.window._liveToasts=A end local B=A[w.
main.Parent]if not B then B={}A[w.main.Parent]=B end w._live=B table.insert(B,w)while#B>n do local C=table.remove(B,1)if
C and C~=w then task.spawn(C._dismiss,C)end end w._connections={w.window:Connect(w.body.MouseEnter,function()w._hovered=
true end),w.window:Connect(w.body.MouseLeave,function()w._hovered=false end),w.window:Connect(w.body.InputBegan,function
(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then w:_dismiss()end
end)}task.spawn(function()w:_show()end)return w end function ae._measure(t)local u,v=ah.textWidth(t.window.theme.
TitleFont,16,t.title),if t.subtitleLabel then ah.textWidth(t.window.theme.Font,14,t.subtitle)else 0 local w,x=math.max(u
,v),if t.iconLabel then t._leftPad+t._iconSize+j else t._leftPad local y=math.clamp(x+w+t._rightPad,t._minWidth,m)if x+w
+t._rightPad>m then local z=m-x-t._rightPad for A,B in{t.titleLabel,t.subtitleLabel}do if B then B.AutomaticSize=Enum.
AutomaticSize.None B.TextTruncate=Enum.TextTruncate.AtEnd B.Size=UDim2.fromOffset(z,B.Size.Y.Offset)end end end local z=
if t.subtitleLabel then 31 else 16 local A=math.max(z,if t.iconLabel then t._iconSize else 0)+18 return y,A end function
ae._show(t)if not t.main.Parent then return end ak.notify()local u,v=t:_measure()if t._dismissed or not t.main.Parent
then return end t.main.Size=UDim2.new(0,u,0,0)ag.tweenService:Create(t.main,am,{Size=UDim2.new(0,u,0,v+k)}):Play()ag.
tweenService:Create(t.body,al,{Position=q}):Play()ag.tweenService:Create(t.body,an,{BackgroundTransparency=0}):Play()ag.
tweenService:Create(t.stroke,an,{Transparency=0.9}):Play()ag.tweenService:Create(t.shadow,b,{Transparency=0.6}):Play()ag
.tweenService:Create(t.titleLabel,b,{TextTransparency=0}):Play()task.wait(0.05)if t._dismissed or not t.main.Parent then
return end if t.iconLabel then ag.tweenService:Create(t.iconLabel,b,{BackgroundTransparency=0.95}):Play()ag.tweenService
:Create(t.iconLabel,b,{ImageTransparency=0}):Play()end task.wait(0.05)if t._dismissed or not t.main.Parent then return
end if t.subtitleLabel then ag.tweenService:Create(t.subtitleLabel,b,{TextTransparency=0.5}):Play()end local w=0 while w
<t.duration and not t._dismissed and t.main.Parent do local x=task.wait()if not t._hovered then w+=x end end t:_dismiss(
)end function ae._dismiss(t)if t._dismissed then return end t._dismissed=true local u=t._live local v=u and table.find(u
,t)if u and v then table.remove(u,v)end if not t.main.Parent then return end ag.tweenService:Create(t.body,an,{
BackgroundTransparency=1}):Play()ag.tweenService:Create(t.stroke,an,{Transparency=1}):Play()ag.tweenService:Create(t.
shadow,b,{Transparency=1}):Play()ag.tweenService:Create(t.titleLabel,b,{TextTransparency=1}):Play()if t.subtitleLabel
then ag.tweenService:Create(t.subtitleLabel,b,{TextTransparency=1}):Play()end if t.iconLabel then ag.tweenService:
Create(t.iconLabel,b,{ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(t.body,c,{Size=
UDim2.new(1,-60,1,0)}):Play()local w=ag.tweenService:Create(t.main,c,{Size=UDim2.new(0,t.main.Size.X.Offset,0,0)})w:
Play()w.Completed:Wait()if not t.main.Parent then return end for x,y in t._connections do t.window:Disconnect(y)end t.
window:DestroySubtree(t.main)end return ae end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al=ac(af.variables),
ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(am,an)an=if typeof(an)
=='table'then an else{}local b=setmetatable({tab=assert(am,'Missing argument #1 (Tab expected)'),window=am.window,name=
an.name or an.Name or'Switch',icon=an.icon or an.Icon,description=an.description or an.Description,forgetState=an.
forgetState or an.ForgetState or am.forgetState,compact=am.compact or false,flag=an.flag or an.Flag or(not(an.
forgetState or an.ForgetState or am.forgetState)and ah.deriveFlagFromName(an.name or an.Name or'Switch')or nil),callback
=an.callback or an.Callback or function()end,value=if(an.value or an.Value)~=nil then(an.value or an.Value)elseif(an.
currentValue or an.CurrentValue)~=nil then(an.currentValue or an.CurrentValue)else false},ae)b.window:_registerControl(b
)if b.compact then b:_buildCompact()else b:_buildFull()end if b.description and not b.compact then b.descriptor=ac(ab.
Parent.descriptor).new(b.tab,{description=b.description})end return b end function ae._buildSwitch(am,an)local b=am.
window am.functionContainer=b:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,
Parent=an},{BackgroundColor3='ToggleTrack'})b:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.functionContainer
})am.containerStroke=b:Create('UIStroke',{Transparency=1,Parent=am.functionContainer},{Color='SurfaceStroke'})am.
indicator=b:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=am.value and UDim2.new(1,-28,0.5,0)
or UDim2.new(1,-47,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=am.value and am.window.theme.AccentColor or am
.window.theme.ToggleKnobOff,BackgroundTransparency=1,Parent=am.functionContainer})b:Create('UICorner',{CornerRadius=UDim
.new(1,0),Parent=am.indicator})am.indicatorStroke=b:Create('UIStroke',{Color=am.value and am.window.theme.AccentStroke
or Color3.fromRGB(255,255,255),Transparency=1,Parent=am.indicator})am.indicatorGlow=b:CreateGlow(am.indicator,
'AccentColor',20,1)am.overlay=b:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0
),AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.
functionContainer},{Visible='DarkToggleOverlay'})b:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.overlay})am.
overlayGradient=b:Create('UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30
,30,30)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.
new(0,1),NumberSequenceKeypoint.new(1,0.35)},Parent=am.overlay})return am.functionContainer end function ae.
_performToggle(am)al.click()am.value=not am.value am:_animateIndicator()am.window:_runGuarded(am,am.callback,am.value)am
.window:_persist(am)end function ae._buildFull(am)local an=am.window am.main=an:Create('Frame',{Size=UDim2.new(1,-20,0,
41),BorderSizePixel=0,Name=am.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})am.stroke=an:StyleElementBody(am.main)am.hoverOverlay=an:
CreateHoverOverlay(am.main)am.container=an:Create('Frame',{BorderSizePixel=0,Parent=am.main,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})am.containerLayout=an:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.
iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,
ImageTransparency=1,Parent=am.container},{ImageColor3='ContentColor'})end am.title=an:Create('TextLabel',{Text=ak.t(am.
name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.
AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.
container},{TextColor3='ContentColor',FontFace='Font'})am.interact=an:Create('TextButton',{BackgroundTransparency=1,Size
=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,
ZIndex=10,Parent=am.main})am:_buildSwitch(am.main)am.functionContainer.Position=UDim2.new(1,-15,0,20)am.
functionContainer.AnchorPoint=Vector2.new(1,0.5)am.window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.
MouseButton1Click,function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(am.main,TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()am:_performToggle()task.wait(0.11)ag.
tweenService:Create(am.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,
-20,0,41)}):Play()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end function ae._buildCompact(am)local an=am.window
am.main,am.stroke,am.interact=an:_buildCompactRow(am.tab,am.name,10)am.hoverOverlay=am.interact an:Create('UIPadding',{
PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=am.interact})an:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.
SpaceBetween,Padding=UDim.new(0,10),Parent=am.interact})am.container=an:Create('Frame',{AutomaticSize=Enum.AutomaticSize
.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,Parent=am.interact})an:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.container})an:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=am.container})if am.icon then am.iconLabel=an:Create('ImageLabel',{Image=am.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=am.container
},{ImageColor3='ContentColor'})end am.title=an:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=am.container},{
TextColor3='ContentColor',FontFace='Font'})an:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.title})am:
_buildSwitch(am.interact)am.functionContainer.LayoutOrder=1 am.window:_wireElementHover(am)am.window:ConnectFor(am,am.
interact.MouseButton1Click,function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()am:_performToggle()task.wait(0.11)ag.tweenService:Create(am.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.window.theme.
ElementStrokeTransparency}):Play()end)end function ae._animateIndicator(am)local an=TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out)if am.indicatorGlow then ag.tweenService:Create(am.indicatorGlow,an,{Transparency=
am.value and am.window.theme.AccentGlow or 1}):Play()end if am.value then ag.tweenService:Create(am.indicator,an,{
Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=am.window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.
tweenService:Create(am.indicatorStroke,an,{Color=am.window.theme.AccentStroke,Transparency=0}):Play()else ag.
tweenService:Create(am.indicator,an,{Position=UDim2.new(1,-47,0.5,0),BackgroundColor3=am.window.theme.ToggleKnobOff,
BackgroundTransparency=am.window.theme.ToggleKnobOffTransparency}):Play()ag.tweenService:Create(am.indicatorStroke,an,{
Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local am,an=TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,
0.35)function ae._setShown(b,c,d)local e=b.window if c then e:_revealCommon(b,d)e:_reveal(b.indicator,{BackgroundColor3=
b.value and e.theme.AccentColor or e.theme.ToggleKnobOff,BackgroundTransparency=b.value and 0 or e.theme.
ToggleKnobOffTransparency},d,am)e:_reveal(b.indicatorStroke,{Color=b.value and e.theme.AccentStroke or Color3.fromRGB(
255,255,255),Transparency=b.value and 0 or 0.7},d,am)e:_reveal(b.indicatorGlow,{Transparency=b.value and e.theme.
AccentGlow or 1},d,an)e:_reveal(b.overlay,{BackgroundTransparency=0},d,am)e:_reveal(b.containerStroke,{Transparency=0.85
},d,am)e:_reveal(b.functionContainer,{BackgroundTransparency=e.theme.ToggleTrackTransparency},d,am)else e:_hideCommon(b,
d)e:_reveal(b.indicator,{BackgroundTransparency=1},d,am)e:_reveal(b.indicatorStroke,{Transparency=1},d,am)e:_reveal(b.
indicatorGlow,{Transparency=1},d,an)e:_reveal(b.overlay,{BackgroundTransparency=1},d,am)e:_reveal(b.containerStroke,{
Transparency=1},d,am)e:_reveal(b.functionContainer,{BackgroundTransparency=1},d,am)end end function ae._refreshTheme(b)
local c,d,e=b.window.theme,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService e:Create(b
.functionContainer,d,{BackgroundTransparency=c.ToggleTrackTransparency}):Play()e:Create(b.indicator,d,{BackgroundColor3=
b.value and c.AccentColor or c.ToggleKnobOff,BackgroundTransparency=b.value and 0 or c.ToggleKnobOffTransparency}):Play(
)e:Create(b.indicatorStroke,d,{Color=b.value and c.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if b.
indicatorGlow then e:Create(b.indicatorGlow,d,{Transparency=b.value and c.AccentGlow or 1}):Play()end end function ae.
_minWidth(b)local c=90 if b.icon then c+=21 end c+=ah.textWidth(b.window.theme.Font,16,ak.resolve(b.name))return c end
ai(ae)aj(ae)function ae.Set(b,c,d)local e=b.value~=c b.value=c if e then b:_animateIndicator()end if not d then b.window
:_runGuarded(b,b.callback,b.value)b.window:_persist(b)end end return ae end)()end,[30]=function()local aa,ab,ac=a(30)
local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,an,b,c,d,e,f,g,h,i,j=ac(ae.
image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.
windowSizing),ac(ae.imageCache),ac(ae.services),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.Parent.search),ac(ab.Parent.
sidebar),ac(ae.variables),ac(ae.pointer),ab.Parent.Parent.themes,{}j.__index=j local k,l,m,n,o=TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.new(0.5,0,0,20)
,UDim2.new(0.5,0,0,12)local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I=UDim2.new(0.5,0,0,n.Y.Offset+l.Y.Offset+12),
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2,8,80,20,24,5,0.8,0.8,16,28,
5,32 function j._fillGameSubtitle(J)task.spawn(function()local K,L=pcall(function()return b.getService
'MarketplaceService':GetProductInfo(game.PlaceId)end)local M=if K and type(L)=='table'and type(L.Name)=='string'then L.
Name else nil if not M or M==''or J.unloaded or not J.subtitle then return end if utf8.len(M)and(utf8.len(M)::number)>I
then M=string.sub(M,1,(utf8.offset(M,I)::number)-1)..'...'end J.subtitle.Text=M end)end local J,K,L,M=
'https://discord.gg/Bukn7UyvKx',-1E5,180,1 local function N(O):(UDim2,number)local P=g.workspace.CurrentCamera local Q=P
and P.ViewportSize local R=am.scale(Q,g.userInputService.TouchEnabled)return am.fit(Q,O,R),R end local O,P={
'TopLeftRadius','TopRightRadius','BottomLeftRadius','BottomRightRadius'},(function()return(pcall(function()local O=
Instance.new'UICorner'O.TopLeftRadius=UDim.new(0,1)O:Destroy()end))end)()local function Q(R)return if R then c.sidebar
else c.top end local R={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,TabStroke=
true,SliderProgress=true}local function S(T,U)if R[T]and typeof(U)=='Color3'then return ColorSequence.new(U)end return U
end local function T(U)return if typeof(U)=='ColorSequence'then U.Keypoints[1].Value else U end local function U(V,W)
local X=V._toastsTop if not X then return end local Y=if V._collapsedShown then p else o if not W or X.Position==Y then
X.Position=Y return end g.tweenService:Create(X,q,{Position=Y}):Play()end local function V(W,X)local Y=0.299*W.R+0.587*W
.G+0.114*W.B local Z=if Y>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return W:Lerp(Z,X)end local function W(X,Y)if
Y.ElementGradient then local Z=T(X.ElementGradient)if Y.ElementStroke==nil then X.ElementStroke=V(Z,0.28)end if Y.
ElementStrokeGradient==nil then X.ElementStrokeGradient=ColorSequence.new(V(Z,0.4))end if Y.ElementStrokeHover==nil then
X.ElementStrokeHover=V(Z,0.52)end end if Y.TabBackground and Y.TabStroke==nil then X.TabStroke=ColorSequence.new(V(T(X.
TabBackground),0.4))end end local function X(Y)if typeof(Y)=='table'then return Y elseif typeof(Y)=='string'then local Z
=i:FindFirstChild(string.lower(Y))if Z then return ac(Z)end ak.warn("Rayfield: unknown theme '"..Y.."', using default")
elseif Y~=nil then ak.warn[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end
return ac(i.default)end local function Y(Z)local _,ao=table.clone(ac(i.default)),X(Z)for ap,aq in ao do _[ap]=S(ap,aq)
end if typeof(Z)=='table'then W(_,ao)end local ap=if typeof(Z)=='table'then Z else nil if not(ap and(ap.Font or ap.font)
)then _.Font=g.brandFont(Enum.FontWeight.Medium)end if not(ap and(ap.TitleFont or ap.titleFont))then _.TitleFont=g.
brandFont(Enum.FontWeight.SemiBold)end return _ end function j.new(ao)ao=if typeof(ao)=='table'then ao else{}if ao.
translations or ao.Translations then aj.register(ao.translations or ao.Translations)end if ao.translator or ao.
Translator then aj.translator=ao.translator or ao.Translator end aj.setActive(ao.locale or ao.Locale or aj.detect())
local ap=ao.fallbackFont or ao.FallbackFont if ap then g.setFallbackFont(ap)end local aq=Q(ao.sidebarLayout or ao.
SidebarLayout)local Z,_=N(aq.mode)local ar=ao.icon if ar==nil then ar=ao.Icon end if ar==nil then ar=an.logo()elseif ar
==false then ar=nil end local as=setmetatable({name=ao.name or ao.Name or'Example',subheading=if(ao.subtitle or ao.
Subtitle)~=nil then(ao.subtitle or ao.Subtitle)or nil else'',_subtitleIsGame=(ao.subtitle or ao.Subtitle)==nil,layout=aq
,size=Z,scale=_,_overlayScales={},instances={},connections={},icon=ar,showName=ao.showName or ao.ShowName or ao.name or
ao.Name or'Example',showIcon=ao.showIcon or ao.ShowIcon or ar or ai.icons.rayfield,showIconOnly=ao.showIconOnly or ao.
ShowIconOnly or false,profileText=ao.profile or ao.Profile,themeProperties={},localeProperties={},tabs={},tabSections={}
,tags={},selectedTab=nil,theme=Y(ao.theme or ao.Theme),controls={},configuration=(function()local as=ao.configuration or
ao.Configuration if not as then return{}end return{autoSave=as.autoSave or as.AutoSave,autoLoad=as.autoLoad or as.
AutoLoad,fileName=as.fileName or as.FileName,customFolder=as.customFolder or as.CustomFolder}end)()},j)as.Flags=
setmetatable({},{__index=function(at,au)local av=as.controls[au]return av and av.value end,__newindex=function(at,au,av)
local aw=as.controls[au]if not aw then ak.warn("Rayfield: no flag '"..tostring(au).."' to set")return end aw:Set(av)end,
__iter=function()local at return function()local au at,au=next(as.controls,at)if at then return at,au.value end return
nil end end})as.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=false,welcomeToast=true,haptics=
true,showProfile=true}as.screenGui=as:Create('ScreenGui',{Name=g.httpService:GenerateGUID(false),IgnoreGuiInset=true,
ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=g.
guiContainer})as.main=as:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=as.name,ZIndex=1,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((as.size.X.Offset-50),0),
BackgroundTransparency=1,Visible=false,Parent=as.screenGui})as.uiScale=as:Create('UIScale',{Scale=as.scale,Parent=as.
main})as.drag=ac(ab.Parent.drag).new(as)as.windowCorner=as:Create('UICorner',{Parent=as.main},{CornerRadius=
'CornerRoundness'})as.windowStroke=as:Create('UIStroke',{Transparency=1,Parent=as.main},{Color='SurfaceStroke'})as.
windowGradient=as:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=as.main},{Color={'WindowColor',ag.
toColorSequence}})as.bottomFade=as:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=as.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,
BackgroundTransparency=1,Parent=as.main})as.bottomFadeCorner=as:_roundCorners(as.bottomFade,as.layout.fadeCorners)as.
bottomFadeGradient=as:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,0.2),Transparency=as.layout.
fadeTransparency,Parent=as.bottomFade},{Color={'WindowColor',function(at)return ColorSequence.new(ag.toColorSequence(at)
.Keypoints[1].Value)end}})as.topbar=as:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,as.layout.
topbarHeight),Active=true,Parent=as.main})as.topContainer=as:Create('Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.
new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Parent=as.
topbar})as.topContainerLayout=as:Create('UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=as.topContainer})as.titleContainer=as:Create('Frame',{Size=UDim2.fromOffset(50,24),
Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency
=1,LayoutOrder=1,Parent=as.topContainer})as.titleContainerLayout=as:Create('UIListLayout',{Padding=UDim.new(0,3),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Parent=as.titleContainer})if as.name then as.title=as:Create('TextLabel',{Text=aj.t(as.name),FontFace=g.
brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency
=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=as.titleContainer},{
FontFace='Font',TextColor3='TitlingColor'})end if as.icon then as.topbarIcon=as:Create('ImageLabel',{Image=as.icon,
BackgroundTransparency=1,Size=UDim2.fromOffset(42,42),ImageTransparency=1,Parent=as.topContainer},{ImageColor3=
'TitlingColor'})end if as.subheading then as.subtitle=as:Create('TextLabel',{Text=aj.t(as.subheading),Size=UDim2.
fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=as.titleContainer},{TextColor3='TitlingColor',FontFace=
'Font'})if as._subtitleIsGame then as:_fillGameSubtitle()end end as.tagContainer=as:Create('Frame',{AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,
BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=as.topContainer})as.tagContainerLayout=as:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=as.tagContainer})as.windowShadow=as:CreateGlow(as.
main,'ShadowColor',20,1)as.elements=as:Create('Frame',{Size=UDim2.new(1,0,1,-as.layout.chromeHeight),Position=UDim2.
fromScale(1,1),AnchorPoint=Vector2.new(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ClipsDescendants=true,Parent=as.main})if as.layout.mode=='sidebar'then as.elementsCorner=as:
_roundCorners(as.elements,as.layout.cardCorners)as.elementsStroke=as:Create('UIStroke',{ApplyStrokeMode=Enum.
ApplyStrokeMode.Border,Transparency=1,Parent=as.elements},{Color='SurfaceStroke'})as:Create('UIGradient',{Rotation=as.
layout.cardStrokeRotation,Transparency=as.layout.cardStrokeTransparency,Parent=as.elementsStroke})end as.elementsLayout=
as:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=as.layout.pageDirection,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.EasingStyle.Exponential
,TweenTime=0.4,Parent=as.elements})if as.layout.mode=='sidebar'then f.build(as,as.layout)f.applyWidth(as,c.railWidthFor(
as.layout,as.size.X.Offset))else as.tabList=as:Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,0,as.
layout.tabStripHeight),Position=UDim2.new(0.5,0,0,as.layout.tabStripTop),AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.X,Parent=as.main})as.tabListLayout=as:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
as.tabList})as:Create('UIPadding',{PaddingLeft=UDim.new(0,22),PaddingRight=UDim.new(0,10),Parent=as.tabList})end as.
actionContainer=as:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,Parent=as.topbar})as.actionsListLayout=as:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=Enum.SortOrder.LayoutOrder,Parent=
as.actionContainer})as.rfSettings=as:CreateTab{name='Rayfield Settings',customOrder=1000,neglectSelector=true,
forgetState=true}ac(ab.Parent.action).new(as,{name='Close',icon=ai.icons.close,order=1,callback=function()as:ToggleHide(
)end})as.minimiseAction=ac(ab.Parent.action).new(as,{name='Minimise',icon=ai.icons.minimise,order=2,callback=function()
as:ToggleMinimise()end})as.settingsAction=ac(ab.Parent.action).new(as,{name='Settings',icon=ai.icons.settings,order=3,
linkedTab=as.rfSettings,callback=function()as.rfSettings:Select()end})e.build(as)as:_applyRailWidth()as.unloaded=false
as.minimised=false as.hidden=true as.animating=false as._revealing=false as.hasShownOnce=false as._collapsedShown=false
as:LoadSettings()if as.layout.mode=='sidebar'then f.reflowProfile(as)f.setSubtitle(as,as.profileText)end al.
setContainer(as.screenGui)al.setEnabled(as.settings.haptics)d.buildCollapsedFace(as)as:_bindKeybind()as:
_bindMouseOverride()as:_bindTopbarDrag()as:_watchViewport()as:_buildSettingsUI()as.discordInvite=ao.discordInvite or ao.
DiscordInvite or J if ao.homeTab~=false and ao.HomeTab~=false then as:_buildHomeTab()end if ao.discordReminder~=false
and ao.DiscordReminder~=false then as:_startDiscordReminder()end if ao.themeTab~=false and ao.ThemeTab~=false then as:
_buildThemeTab()end if as.settings.theme then as:ChangeTheme(as.settings.theme)end as:_syncLiveAnimation()return as end
local function ao(ap:string):boolean local aq=getfenv()local ar=(aq.getgenv and aq.getgenv().setclipboard)or aq.
setclipboard or aq.toclipboard if type(ar)~='function'then return false end return(pcall(ar,ap))end local function ap():
number local aq,ar=pcall(function()return b.getService'Stats'.Network.ServerStatsItem['Data Ping']:GetValue()end)if aq
and type(ar)=='number'then return ar end local as=g.localPlayer local at,au=pcall(function()return as:GetNetworkPing()
end)return if at and type(au)=='number'then au*2000 else 0 end local function aq():number local ar,as=pcall(function()
return#b.getService'Players':GetPlayers()end)return if ar then as else 0 end function j._buildHomeTab(ar)ar.homeTab=ar:
CreateTab{name='Home',icon=ai.icons.home,customOrder=K,builtIn=true,keepSelection=true,forgetState=true}local as=ar.
homeTab:CreateGroup{direction='row'}local at,au,av,aw=as:CreateStat{name='FPS',value=60,numberEasing=false},as:
CreateStat{name='Ping',value=0,suffix=' ms',numberEasing=false},as:CreateStat{name='Players',value=aq(),numberEasing=
false},ar.discordInvite ar.homeTab:CreateText{name='Astris Hub Discord',text='Updates, new scripts and help. '..string.
gsub(aw,'^https?://','')}ar.homeTab:CreateButton{name='Copy Discord invite',callback=function()if ao(aw)then ar:Toast{
title='Invite copied',subtitle='Paste it in your browser or Discord'}else ar:Toast{title=aw,subtitle=
"Your executor can't copy, type it in instead"}end end}local Z,_=0,0 ar:Connect(g.runService.Heartbeat,function(ax:
number)Z+=1 _+=ax if _<M then return end at:Set(math.round(Z/_))au:Set(math.round(ap()))av:Set(aq())Z,_=0,0 end)end
function j._startDiscordReminder(ar)local as,at=string.gsub(ar.discordInvite,'^https?://',''),0 ar:Connect(g.runService.
Heartbeat,function(au:number)at+=au if at<L then return end at=0 ar:Notify{title='Join the Astris Hub Discord',content=
as,icon=ai.icons.discord}end)end local ar,as=100000,{'Default','Amethyst','Cobalt','Ember','Frost','Rose'}function j.
_buildThemeTab(at)at.themeTab=at:CreateTab{name='Theme',icon=ai.icons.palette,customOrder=ar,builtIn=true,forgetState=
true}local au='Default'for av,aw in as do if string.lower(aw)==at.settings.theme then au=aw end end at.themeTab:
CreateDropdown{name='Theme',description='Changes the look of this menu. Saved for next time.',options=as,currentOption=
au,callback=function(av)if typeof(av)~='string'then return end at.settings.theme=string.lower(av)at:ChangeTheme(at.
settings.theme)at:SaveSettings()end}task.defer(function()if not at.unloaded and not at.selectedTab and at.themeTab then
at.themeTab:Select(true)end end)end function j._syncLiveAnimation(at)if not at.theme.LiveAnimation then at.
_liveAnimating=false return end if at._liveAnimating then return end at._liveAnimating=true at._liveGeneration=(at.
_liveGeneration or 0)+1 local au=at._liveGeneration task.spawn(function()local av,aw=true,TweenInfo.new(10,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)while at._liveGeneration==au and at._liveAnimating and not at.unloaded do
local ax=g.tweenService:Create(at.windowGradient,aw,{Offset=Vector2.new(if av then 0.4 else-0.2,0),Rotation=(if av then
220 else 280)})at._liveTween=ax ax:Play()ax.Completed:Wait()av=not av end if at._liveGeneration==au then at.
_liveAnimating=false at._liveTween=nil end end)end function j.ChangeTheme(at,au)local av=if typeof(au)=='table'then au
else Y(au)for aw,ax in av do at.theme[aw]=S(aw,ax)end if typeof(au)=='table'then W(at.theme,av)end for aw,ax in at.
themeProperties do for Z,_ in ax do local ay=if typeof(_)=='table'then _[2](at.theme[_[1] ])else at.theme[_]if typeof(ay
)=='Color3'or typeof(ay)=='number'then g.tweenService:Create(aw,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[Z]=ay}):Play()else aw[Z]=ay end end end if at.hidden then at._themeRefreshPending=true else at:
_refreshElementThemes()end at:_syncLiveAnimation()end function j._refreshElementThemes(at)for au,av in at.tabs do for aw
,ax in av.elements do if ax._refreshTheme then ax:_refreshTheme()end end end end function j.CreateTab(at,au)assert(not
at.unloaded,'Cannot create a tab on an unloaded window.')local av=ac(ab.Parent.tab).new(at,au)table.insert(at.tabs,av)if
not av.neglectSelector then local aw=not av.builtIn or av.keepSelection for ax,ay in at.tabs do if ay~=av and not ay.
neglectSelector and(not ay.builtIn or ay.keepSelection)then aw=false break end end if aw then av:Select(true)end if not
at.hidden and not at.minimised then av.topbarItem.Visible=true av:_applyVisual(if at.selectedTab==av then'selected'else
'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end return av end function j.
CreateSection(at,au)assert(not at.unloaded,'Cannot create a section on an unloaded window.')local av=ac(ab.Parent.
tabSection).new(at,au)table.insert(at.tabSections,av)if not av.inert and not at.hidden and not at.minimised then av:
_setVisible(true)av:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return av end
function j._setTabSectionsShown(at,au,av)for aw,ax in at.tabSections do ax:_setShown(au,av)end end function j.
_setTabSectionsVisible(at,au)for av,aw in at.tabSections do aw:_setVisible(au)end end function j.CreateTag(at,au)assert(
not at.unloaded,'Cannot create a tag on an unloaded window.')local av=ac(ab.Parent.tag).new(at,au)table.insert(at.tags,
av)return av end function j._registerControl(at,au)if not au.flag or au.flag==''or au.forgetState then return end local
av=au.flag if at.controls[av]then local aw=2 while at.controls[av..aw]do aw+=1 end av=av..aw ak.warn(
"Rayfield: duplicate config flag '"..au.flag.."', saving this one as '"..av..
"'. Set a unique flag to keep it stable across sessions.")end au.flag=av at.controls[av]=au return av end function j.
_restoreLate(at,au)if not at._loadedConfig or not au.flag or au.forgetState then return end local av=at._loading at.
_loading=true ah.applyTo(au,at._loadedConfig[au.flag])at._loading=av end function j._persist(at,au)if au.flag and not au
.forgetState and at.configuration.autoSave and not at._loading then task.spawn(at.Save,at)end end function j.
_unregisterControl(at,au)if au.flag and at.controls[au.flag]==au then at.controls[au.flag]=nil end end function j.
_keybindUsing(at,au,av)if typeof(au)~='EnumItem'or au==Enum.KeyCode.Unknown then return nil end for aw,ax in at.tabs do
for ay,Z in ax.elements do if Z~=av and Z.__type=='Keybind'and Z.value==au then return Z end end end return nil end
function j.Notify(at,au)if at.unloaded then return end if not at.notifications then at.notifications=at:Create('Frame',{
Name='Notifications',Size=UDim2.new(0,300,0,800),Position=UDim2.new(1,-20,0,g.guiService:GetGuiInset().Y+12),AnchorPoint
=Vector2.new(1,0),BackgroundTransparency=1,Parent=at.screenGui})at:_scaleOverlay(at.notifications)at:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=at
.notifications})end return ac(ab.Parent.notification).new(at,au)end function j.Toast(at,au)if at.unloaded then return
end au=if typeof(au)=='table'then au else{}local av=au.position or au.Position or'Top'local aw=typeof(av)~='string'or av
:lower()~='bottom'au.position=if aw then'Top'else'Bottom'local ax=if aw then'_toastsTop'else'_toastsBottom'local ay=at[
ax]if not ay then ay=at:Create('Frame',{Name='Toasts',Size=UDim2.new(0,r,1,-24),Position=if aw then o else UDim2.new(0.5
,0,1,-12),AnchorPoint=if aw then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.
toast,Parent=at.screenGui})at:_scaleOverlay(ay)at:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,
VerticalAlignment=if aw then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=ay})at[ax]=ay if aw then U(
at,false)end end return ac(ab.Parent.toast).new(at,au,ay)end function j.Popup(at,au)if at.unloaded then return end
return ac(ab.Parent.popup).new(at,au)end function j.Hide(at)if at.animating or at.hidden then return end if at.
_searching then e.close(at,{showTabs=false,jumpTo=at.selectedTab and at.selectedTab.tabPage})end if at._recordingKeybind
then at._recordingKeybind:_stopRecording()end at.animating=true at._revealing=true at.hidden=true at.collapsedInteract.
Visible=false if at.minimised then at.minimised=false af.assign(at.minimiseAction.iconLabel,'Image',ai.icons.minimise)
end at._restorePosition=at.main.Position local au,av=at:_collapsedRect()local aw,ax,ay,Z=TweenInfo.new(0.18,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)g.tweenService:Create(at.drag.dragCosmetic,aw,{Size=UDim2.fromOffset(0,4),
BackgroundTransparency=1}):Play()task.delay(0.18,function()if not at.hidden then return end at.drag.drag.Visible=false
end)at:_fadeSurfaces(false,aw)if at.title then g.tweenService:Create(at.title,aw,{TextTransparency=1}):Play()end if at.
subtitle then g.tweenService:Create(at.subtitle,aw,{TextTransparency=1}):Play()end if at.topbarIcon then g.tweenService:
Create(at.topbarIcon,aw,{ImageTransparency=1}):Play()end for _,az in ipairs(at.actionContainer:GetChildren())do if az:
IsA'Frame'then g.tweenService:Create(az.ImageLabel,aw,{ImageTransparency=1}):Play()end end for az,_ in at.tags do _:
_setShown(false,aw)end for az,_ in pairs(at.tabs)do if not _.neglectSelector and _.topbarItem then _:_applyVisual(
'hidden',aw)end end at:_setTabSectionsShown(false,aw)at:_fadeSelectedElementsOut()local az=g.tweenService:Create(at.main
,ax,{Size=av,Position=au})g.tweenService:Create(at.uiScale,ax,{Scale=at:_pillScale()}):Play()az.Completed:Connect(
function()if at.unloaded or not at.hidden then return end at._collapsedShown=true U(at,true)at.collapsedInteract.Visible
=true at.animating=false at._revealing=false end)az:Play()g.tweenService:Create(at.windowCorner,ay,{CornerRadius=UDim.
new(1,0)}):Play()task.delay(0.18,function()if not at.hidden then return end at.topbar.Visible=false at:
_setContentVisible(false)d.setCollapsedShown(at,true,Z)end)end function j.ToggleHide(at)if at.animating then return end
if at.hidden then at:Show()else at:Hide()end end function j.ToggleMinimise(at)if at.animating or at.hidden then return
end if at._searching then e.close(at,{showTabs=true})end at.animating=true local au,av=TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out)if at.minimised then at.minimised=false af.assign(at.minimiseAction.iconLabel,'Image',ai.icons.minimise)local aw=at:
_headerAnchored(at.main.Position,at.layout.topbarHeight,at.size.Y.Offset)g.tweenService:Create(at.main,au,{Size=at.size,
Position=aw}):Play()at:_fadeSurfaces(true,av)g.tweenService:Create(at.drag.drag,au,{Position=UDim2.new(aw.X.Scale,aw.X.
Offset,aw.Y.Scale,aw.Y.Offset+at.size.Y.Offset*at.scale/2+15)}):Play()task.delay(0.2,function()if at.minimised or at.
hidden then return end at:_setContentVisible(true)for ax,ay in pairs(at.tabs)do if not ay.neglectSelector and ay.
topbarItem then ay.topbarItem.Visible=true ay:_applyVisual(if at.selectedTab==ay then'selected'else'unselected',av)end
end at:_setTabSectionsVisible(true)at:_setTabSectionsShown(true,av)at:_revealElements(0.035,0.4)end)task.delay(0.5,
function()at.animating=false end)else at.minimised=true af.assign(at.minimiseAction.iconLabel,'Image',ai.icons.maximise)
at:_fadeSelectedElementsOut()for aw,ax in pairs(at.tabs)do if not ax.neglectSelector and ax.topbarItem then ax:
_applyVisual('hidden',av)end end at:_setTabSectionsShown(false,av)task.delay(0.3,function()if not at.minimised then
return end at:_setContentVisible(false)for aw,ax in pairs(at.tabs)do if not ax.neglectSelector and ax.topbarItem then ax
.topbarItem.Visible=false end end at:_setTabSectionsVisible(false)end)at:_fadeSurfaces(false,av)local aw=at:
_headerAnchored(at.main.Position,at.size.Y.Offset,at.layout.topbarHeight)g.tweenService:Create(at.main,au,{Size=UDim2.
fromOffset(at.size.X.Offset,at.layout.topbarHeight),Position=aw}):Play()g.tweenService:Create(at.drag.drag,au,{Position=
UDim2.new(aw.X.Scale,aw.X.Offset,aw.Y.Scale,aw.Y.Offset+at.layout.topbarHeight*at.scale/2+15)}):Play()task.delay(0.5,
function()at.animating=false end)end end function j._syncDragBar(at)local au=at.drag and at.drag.drag if not au then
return end local av,aw=at.main.Position,at.size.Y.Offset*at.scale/2+15 au.Position=UDim2.new(av.X.Scale,av.X.Offset,av.Y
.Scale,av.Y.Offset+aw)end function j._fitCenter(at,au:number,av:number,aw:Vector2):(number,number)local ax,ay,az=at.
screenGui.AbsoluteSize,aw.X/2,aw.Y/2 local Z=az+y if at.settings and at.settings.keepOnScreen then au=math.clamp(au,ay+y
,math.max(ay+y,ax.X-ay-y))return au,math.clamp(av,Z,math.max(Z,ax.Y-az-y))end local _=math.min(at.layout.topbarHeight*at
.scale,aw.Y)au=math.clamp(au,z-ay,math.max(z-ay,ax.X-z+ay))return au,math.clamp(av,Z,math.max(Z,ax.Y-_+az))end function
j._headerAnchored(at,au:UDim2,av:number,aw:number):UDim2 local ax=at.screenGui.AbsoluteSize local ay,az=au.X.Scale*ax.X+
au.X.Offset,au.Y.Scale*ax.Y+au.Y.Offset az+=(aw-av)*at.scale/2 local Z=Vector2.new(at.size.X.Offset,aw)*at.scale ay,az=
at:_fitCenter(ay,az,Z)return UDim2.fromOffset(ay,az)end function j._clampedPosition(at,au:UDim2):UDim2 if au.X.Scale~=0
or au.Y.Scale~=0 then return au end local av=Vector2.new(at.size.X.Offset,at.size.Y.Offset)*at.scale local aw,ax=at:
_fitCenter(au.X.Offset,au.Y.Offset,av)if aw==au.X.Offset and ax==au.Y.Offset then return au end return UDim2.fromOffset(
aw,ax)end function j._clampToScreen(at)at.main.Position=at:_clampedPosition(at.main.Position)end function j.
_applyWindowSize(at)if at.unloaded then return end local au,av=N(at.layout.mode)local aw=au~=at.size or av~=at.scale at.
size=au at.scale=av if not at.hidden then at.uiScale.Scale=av end at:_applyActionSize()for ax=#at._overlayScales,1,-1 do
local ay=at._overlayScales[ax]if ay.instance.Parent then ay.instance.Scale=at:_overlayScale(ay.share)else table.remove(
at._overlayScales,ax)end end at:_applyRailWidth()if at.hidden or at.minimised or at.animating or at._revealing then at.
_pendingResize=at._pendingResize or aw return end if not aw and not at._pendingResize then return end at._pendingResize=
false at.main.Size=au at:_clampToScreen()at:_syncDragBar()end function j._pillScale(at):number return if at.scale<1 then
E else 1 end function j._overlayScale(at,au:number?):number return if at.scale<1 then at.scale*(au or D)else 1 end
function j._scaleOverlay(at,au:GuiObject,av:number?)local aw=at:Create('UIScale',{Scale=at:_overlayScale(av),Parent=au})
table.insert(at._overlayScales,{instance=aw,share=av})return aw end function j._applyActionSize(at)if not at.
actionContainer then return end local au,av,aw=A,B,C if at.scale<1 then au=math.round(F/at.scale)av=math.round(G/at.
scale)aw=math.round(H/at.scale)end at.actionContainer.Size=UDim2.fromOffset(0,av)at.actionsListLayout.Padding=UDim.new(0
,aw)for ax,ay in ipairs(at.actionContainer:GetChildren())do if ay:IsA'Frame'then ay.Size=UDim2.fromOffset(av,av)local az
=ay:FindFirstChild'ImageLabel'if az and az:IsA'ImageLabel'then az.Size=UDim2.fromOffset(au,au)end end end end function j
._applyRailWidth(at)if at.layout.mode~='sidebar'then return end f.applyWidth(at,c.railWidthFor(at.layout,at.size.X.
Offset))end function j._watchViewport(at)local au,av:RBXScriptConnection?=false local function aw()if au then return end
au=true task.defer(function()au=false at:_applyWindowSize()end)end local function ax()if av then at:Disconnect(av)av=nil
end local ay=g.workspace.CurrentCamera if ay then av=at:Connect(ay:GetPropertyChangedSignal'ViewportSize',aw)end aw()end
at:Connect(g.workspace:GetPropertyChangedSignal'CurrentCamera',ax)ax()local ay=0 at:Connect(g.runService.Heartbeat,
function(az:number)ay+=az if ay<x then return end ay=0 at:_applyWindowSize()end)end function j._bindKeybind(at)at:
Connect(g.userInputService.InputBegan,function(au,av)if av or at._recordingKeybind then return end if au.KeyCode==at.
settings.toggleKeybind or au.UserInputType==at.settings.toggleKeybind then at:ToggleHide()end end)end function j.
_bindMouseOverride(at)local au=g.userInputService local function av()return at.settings.mouseOverride and not at.hidden
and not at.minimised end local function aw()if not av()then return end if au:IsMouseButtonPressed(Enum.UserInputType.
MouseButton2)then return end if au.MouseBehavior~=Enum.MouseBehavior.Default then au.MouseBehavior=Enum.MouseBehavior.
Default end if not au.MouseIconEnabled then au.MouseIconEnabled=true end end at:Connect(au:GetPropertyChangedSignal
'MouseBehavior',aw)at:Connect(au:GetPropertyChangedSignal'MouseIconEnabled',aw)at:Connect(au.InputEnded,function(ax)if
ax.UserInputType==Enum.UserInputType.MouseButton2 then aw()end end)at._freeMouse=aw end function j._bindTopbarDrag(at)
local au,av,aw,ax,ay=g.userInputService,false,Vector2.zero,(Vector2.zero)if at.screenGui and at.screenGui.IgnoreGuiInset
then ax=g.guiService:GetGuiInset()end local function az()local Z=h.location(ay)+aw+ax local _,aA=at:_fitCenter(Z.X,Z.Y,
at.main.AbsoluteSize)return UDim2.fromOffset(_,aA)end local function aA(Z,_)for aB,aC in{at.tabList,at.actionContainer}
do local aD,aE=aC.AbsolutePosition,aC.AbsoluteSize if Z>=aD.X and Z<=aD.X+aE.X and _>=aD.Y and _<=aD.Y+aE.Y then return
true end end return false end at:Connect(at.topbar.InputBegan,function(aB,aC)if aC then return end local aD=aB.
UserInputType.Name if aD~='MouseButton1'and aD~='Touch'then return end if aA(aB.Position.X,aB.Position.Y)then return end
if not at:_interactive()then return end av=true if at.screenGui and at.screenGui.IgnoreGuiInset then ax=g.guiService:
GetGuiInset()end ay=aB aw=at.main.AbsolutePosition+at.main.AbsoluteSize*at.main.AnchorPoint-h.location(aB)end)at:
Connect(au.InputEnded,function(aB)local aC=aB.UserInputType.Name if aC=='MouseButton1'or aC=='Touch'then av=false end
end)at:Connect(au.WindowFocusReleased,function()av=false end)at:Connect(g.runService.RenderStepped,function()if not av
then return end if not at:_interactive()then av=false return end at.main.Position=az()if at.drag and at.drag.drag then
local aB=at.main.Position at.drag.drag.Position=UDim2.new(aB.X.Scale,aB.X.Offset,aB.Y.Scale,aB.Y.Offset+(at.main.Size.Y.
Offset*at.scale/2+15))end end)end function j._buildSettingsUI(at)at.rfSettings:CreateSection{name='General'}at.
rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=at.settings.toggleKeybind,isMenuToggle=true,
onChanged=function(au)at.settings.toggleKeybind=au at:SaveSettings()end}at.rfSettings:CreateToggle{name=
'Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=at.settings.
mouseOverride,callback=function(au)at.settings.mouseOverride=au at:SaveSettings()end}at.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=at
.settings.welcomeToast,callback=function(au)at.settings.welcomeToast=au at:SaveSettings()end}at.rfSettings:CreateToggle{
name='Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=at.settings.haptics,
callback=function(au)at.settings.haptics=au al.setEnabled(au)at:SaveSettings()end}at.rfSettings:CreateSection{name=
'Window'}if at.layout.mode=='sidebar'and at.profile then at.rfSettings:CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=at.settings.showProfile,callback=function(au)f.setProfileEnabled(at,au)at:SaveSettings()end}end at.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Keeps the whole window on screen. Off, it can hang off the sides and bottom, but never the top.]],value=at.settings.
keepOnScreen,callback=function(au)at.settings.keepOnScreen=au at:SaveSettings()end}at.rfSettings:CreateButton{name=
'Reset Window Position',callback=function()g.tweenService:Create(at.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()g.tweenService:Create(at.drag.drag,TweenInfo.new(0.5,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,at.size.Y.Offset*at.scale/2+15)}):
Play()end}if next(at.configuration)~=nil then at.rfSettings:CreateSection{name='Configurations'}local au,av,aw=(at:
ListConfigs()[1])local function ax()local ay=at:ListConfigs()av:Refresh(ay)if au and not table.find(ay,au)then au=ay[1]
end if au then av:Set(au,true)end end av=at.rfSettings:CreateDropdown{name='Saved Configurations',icon=ai.icons.config,
options=at:ListConfigs(),value=au,placeholder='No saved configurations',callback=function(ay)au=ay end}aw=at.rfSettings:
CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local ay=at.rfSettings:CreateGroup()ay:CreateButton{name='Save',icon=ai.icons.config,callback=function()local az=
aw.value if az==''then az=au end if not az or az==''then at:Toast{title=aj.resolve'Name your configuration first'}return
end if at:Save(az)then aw:Set''au=az ax()at:Toast{title=aj.resolve'Saved configuration',subtitle=az,icon=ai.icons.config
}else at:Toast{title=aj.resolve"Couldn't save configuration",subtitle=az}end end}ay:CreateButton{name='Load',callback=
function()if not au or au==''then at:Toast{title=aj.resolve'Pick a configuration to load'}return end if at:
_applyNamedConfig(au)then at:Toast{title=aj.resolve'Loaded configuration',subtitle=au}else at:Toast{title=aj.resolve
"Couldn't load configuration",subtitle=au}end end}ay:CreateButton{name='Delete',callback=function()local az=au if not az
or az==''then at:Toast{title=aj.resolve'Pick a configuration to delete'}return end if at:DeleteConfig(az)then ax()at:
Toast{title=aj.resolve'Deleted configuration',subtitle=az}else at:Toast{title=aj.resolve"Couldn't delete configuration",
subtitle=az}end end}end end function j.SetProfile(at,au)at.profileText=au f.setSubtitle(at,au)end function j.
SaveSettings(at)return ah.saveSettings(at)end function j.LoadSettings(at)return ah.loadSettings(at)end function j.
_roundCorners(at,au,av)if not av or not P then return at:Create('UICorner',{Parent=au},{CornerRadius='CornerRoundness'})
end local aw,ax={Parent=au},{}for ay,az in O do aw[az]=UDim.new(0,0)end for ay,az in av do aw[az]=nil ax[az]=
'CornerRoundness'end return at:Create('UICorner',aw,ax)end function j._setElementLocked(at,au,av,aw)av=av==true local ax
=au.locked==true if ax==av and not(av and aw)then return end au.locked=av if not au.lockScrim then at:_buildLockScrim(au
)end local ay=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if av then au.lockScrim.Visible=true
end g.tweenService:Create(au.lockScrim,ay,{BackgroundTransparency=if av then t else 1}):Play()if not av then task.delay(
ay.Time,function()if not au.locked and au.lockScrim then au.lockScrim.Visible=false end end)end local az=au.descriptor
if not az then return end if av then au._descriptionBefore=au._descriptionBefore or az.titleLabel.Text az.titleLabel.
Text=aj.resolve(aw or'This element is locked.')elseif au._descriptionBefore then az.titleLabel.Text=au.
_descriptionBefore au._descriptionBefore=nil end g.tweenService:Create(az.titleLabel,ay,{TextTransparency=if av then u
else 0.7}):Play()end function j._buildLockScrim(at,au)au.lockScrim=at:Create('TextButton',{Name='ElementLock',Active=
true,AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=au.main},{BackgroundColor3={'WindowColor',T}})at:Create(
'UICorner',{Parent=au.lockScrim},{CornerRadius='ElementCornerRadius'})end function j._setContentVisible(at,au)at.
elements.Visible=au at.tabList.Visible=au if at.sidebar then at.sidebar.Visible=au end end function j._fadeSurfaces(at,
au,av)local aw={[at.windowShadow]={Transparency=if au then 0.6 else 1},[at.windowStroke]={Transparency=if au then 0.95
else 1},[at.bottomFade]={BackgroundTransparency=if au then 0 else 1}}if at.elementsStroke then aw[at.elements]={
BackgroundTransparency=if au then at.layout.cardTransparency else 1}aw[at.elementsStroke]={Transparency=if au then 0
else 1}end for ax,ay in aw do if av then g.tweenService:Create(ax,av,ay):Play()else for az,aA in ay do ax[az]=aA end end
end f.setProfileShown(at,au,av)end function j._fadeSelectedElementsOut(at)if at.selectedTab then for au,av in ipairs(at.
selectedTab.elements)do av:_setShown(false,true)end end end function j._revealElements(at,au,av)for aw,ax in pairs(at.
tabs)do if ax~=at.selectedTab then for ay,az in ipairs(ax.elements)do az:_setShown(true,false)end end end local aw=at.
selectedTab if not aw then return end local ax=aw.tabPage local ay=ax.AbsolutePosition.Y local az,aA,aB=ay+ax.
AbsoluteWindowSize.Y,math.floor(av/au),0 for aC,aD in ipairs(aw.elements)do local aE=aD.main.AbsolutePosition.Y local Z=
(aE+aD.main.AbsoluteSize.Y)>ay and aE<az if Z then aD:_setShown(true,true)aB+=1 if aB<=aA then task.wait(au)end else aD:
_setShown(true,false)end end end function j.Show(at)if at.animating or not at.hidden then return end at.animating=true
at._revealing=true if at.configuration.autoLoad and not at._autoLoaded then at._autoLoaded=true local au,av=pcall(at.
Load,at)if not au then ak.warn('Rayfield: Failed to load configuration - '..tostring(av))end end at.hidden=false at.
minimised=false if at._themeRefreshPending then at._themeRefreshPending=false at:_refreshElementThemes()end at.
collapsedInteract.Visible=false if at._freeMouse then at._freeMouse()end if at.hasShownOnce then at:_quickRestore()else
at.hasShownOnce=true at:_firstShow()end end function j._quickRestore(at)local au=at:_clampedPosition(at._restorePosition
or UDim2.new(0.5,0,0.5,0))at._restorePosition=au local av,aw,ax=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)d.setCollapsedShown(at,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local ay=g.tweenService:Create(at.main,av,{Size=at.size,Position=au})g.tweenService:
Create(at.uiScale,av,{Scale=at.scale}):Play()ay.Completed:Connect(function()if at.hidden or at.unloaded then return end
at._collapsedShown=false U(at,true)end)ay:Play()g.tweenService:Create(at.windowCorner,aw,{CornerRadius=at.theme.
CornerRoundness}):Play()task.delay(0.22,function()at.topbar.Visible=true at:_setContentVisible(true)at:_fadeSurfaces(
true,ax)if at.topbarIcon then g.tweenService:Create(at.topbarIcon,ax,{ImageTransparency=0}):Play()end if at.title then g
.tweenService:Create(at.title,ax,{TextTransparency=0}):Play()end if at.subtitle then g.tweenService:Create(at.subtitle,
ax,{TextTransparency=0.7}):Play()end for az,aA in ipairs(at.actionContainer:GetChildren())do if aA:IsA'Frame'then g.
tweenService:Create(aA.ImageLabel,ax,{ImageTransparency=0.6}):Play()end end if at.settingsAction and at.selectedTab==at.
rfSettings then g.tweenService:Create(at.settingsAction.iconLabel,ax,{ImageTransparency=0.2}):Play()end for az,aA in at.
tags do aA:_setShown(true,ax)end for az,aA in pairs(at.tabs)do if not aA.neglectSelector and aA.topbarItem then aA.
topbarItem.Visible=true aA:_applyVisual(if at.selectedTab==aA then'selected'else'unselected',ax)end end at:
_setTabSectionsVisible(true)at:_setTabSectionsShown(true,ax)at:_revealElements(0.035,0.4)end)task.delay(0.22,function()
at.drag.drag.Position=UDim2.new(au.X.Scale,au.X.Offset,au.Y.Scale,au.Y.Offset+at.size.Y.Offset*at.scale/2+15)at.drag.
dragCosmetic.Size=UDim2.fromOffset(0,4)at.drag.dragCosmetic.BackgroundTransparency=1 at.drag.drag.Visible=true g.
tweenService:Create(at.drag.dragCosmetic,av,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()at.animating=false at._revealing=false end)end function j._firstShow(at)at:_setContentVisible(true)
at.uiScale.Scale=at.scale at.drag.drag.Visible=false at.main.Visible=true g.tweenService:Create(at.main,TweenInfo.new(1,
Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=at.size}):Play()task.wait(0.85)
at:_fadeSurfaces(true,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if at.icon
then g.tweenService:Create(at.topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
ImageTransparency=0}):Play()end if at.title then g.tweenService:Create(at.title,TweenInfo.new(0.4,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{TextTransparency=0}):Play()end task.wait(0.1)if at.subtitle then g.tweenService:
Create(at.subtitle,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):
Play()end for au,av in ipairs(at.actionContainer:GetChildren())do if av:IsA'Frame'then task.wait(0.02)g.tweenService:
Create(av.ImageLabel,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):
Play()end end for au,av in at.tags do av:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out))end task.wait(0.2)task.spawn(function()local au=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)at:_setTabSectionsVisible(true)at:_setTabSectionsShown(true,au)local av=0 for aw,ax in pairs(at.tabs
)do if not ax.neglectSelector then ax.topbarItem.Visible=true ax:_applyVisual(if at.selectedTab==ax then'selected'else
'unselected',au)ax:_spinGradients()av+=1 if av<=w then task.wait(v)end end end end)at:_revealElements(0.03,2)task.wait(1
)at:_syncDragBar()at.drag.drag.Visible=true g.tweenService:Create(at.drag.dragCosmetic,TweenInfo.new(0.6,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):Play()g.tweenService:Create(at.drag.
dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.fromOffset(100,4)}):
Play()at.animating=false at._revealing=false local au=g.localPlayer if au and at.settings.welcomeToast and d.isNewUser()
then at:Toast{title=au.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,avatar=au.UserId,minWidth=220}
end end function j.GetPath(at)return ah.getPath(at)end function j.Save(at,au)if au~=nil and(type(au)~='string'or au=='')
then return false end return ah.save(at,au)end function j.Load(at,au)if au~=nil and(type(au)~='string'or au=='')then
return false end return ah.load(at,au)end function j._applyNamedConfig(at,au)if not at:Load(au)then return false end
local av,aw=ah.getPath(at)at._loadedConfigPath=aw at:Save()return true end function j.ListConfigs(at)return ah.list(at)
end function j.DeleteConfig(at,au)return ah.delete(at,au)end function j.Get(at,au)local av=at.controls[au]return av and
av.value end function j.Set(at,au,av)local aw=at.controls[au]if not aw then return false end aw:Set(av)return true end
function j._jumpTo(at,au)if au then at.elementsLayout:JumpTo(au)end end function j.Navigate(at,au)if au==nil then return
end local av for aw,ax in at.tabs do if ax==au or ax.name==au or ax.tabPage==au then av=ax break end end if not av then
return end av:Select()end function j.Create(at,au,av,aw)assert(typeof(au)=='string',
'Invalid argument #1 (string expected)')local ax=Instance.new(au)if aw and at.theme then for ay,az in aw do ax[ay]=(if
typeof(az)=='table'then az[2](at.theme[az[1] ])else at.theme[az])end at.themeProperties[ax]=aw end if av then for ay,az
in av do if aj.isToken(az)then at:_bindLocale(ax,ay,aj.sourceOf(az))else af.assign(ax,ay,az)end end end table.insert(at.
instances,ax)return ax end function j._bindLocale(at,au,av,aw)au[av]=aj.resolve(aw)local ax=at.localeProperties[au]if
not ax then ax={}at.localeProperties[au]=ax end ax[av]=aw end function j.SetLocale(at,au)aj.setActive(au)for av,aw in at
.localeProperties do for ax,ay in aw do av[ax]=aj.resolve(ay)end end end function j.SetTranslator(at,au)aj.translator=au
end function j.RegisterTranslations(at,au)aj.register(au)at:SetLocale(aj.current)end function j.CreateGlow(at,au,av,aw,
ax)local ay={BlurRadius=UDim.new(0,aw),Transparency=ax,ZIndex=-1,Parent=au}if typeof(av)=='string'then return at:Create(
'UIShadow',ay,{Color={av,function(az)return if typeof(az)=='ColorSequence'then az.Keypoints[1].Value else az end}})end
ay.Color=av return at:Create('UIShadow',ay)end function j._flashResult(at,au,av)local aw=au.box if not aw then return
end local ax,ay,az,aA,aB,aC=au.glow,au.boxStroke,av and ai.accent.on or at.theme.ErrorColor,av and ai.accent.onStroke or
at.theme.ErrorStrokeColor,TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)g.tweenService:Create(aw,aB,{BackgroundColor3=az}):Play()if ay then g.
tweenService:Create(ay,aB,{Color=aA,Transparency=0.4}):Play()end if ax then g.tweenService:Create(ax,aB,{Color=aA,
Transparency=0.6}):Play()end au._flashToken=(au._flashToken or 0)+1 local aD=au._flashToken task.delay(0.22,function()if
au._flashToken~=aD then return end g.tweenService:Create(aw,aC,{BackgroundColor3=at.theme.FieldBackground}):Play()if ay
then g.tweenService:Create(ay,aC,{Color=at.theme.SurfaceStroke,Transparency=0.85}):Play()end if ax then g.tweenService:
Create(ax,aC,{Color=at.theme.FieldGlow,Transparency=au._glowIdle or 1}):Play()end end)end function j.CreateHoverOverlay(
at,au)local av=at:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=au})at:Create('UICorner',{Parent=av},{CornerRadius=
'ElementCornerRadius'})return av end function j._wireElementHover(at,au)local av,aw=TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),at.theme at:ConnectFor(au,au.main.MouseEnter,function()if not at:_interactive()then
return end g.tweenService:Create(au.stroke,av,{Transparency=aw.ElementStrokeHoverTransparency,Color=aw.
ElementStrokeHover}):Play()g.tweenService:Create(au.title,av,{TextColor3=aw.ElementTextHoverColor}):Play()if au.
hoverOverlay then g.tweenService:Create(au.hoverOverlay,av,{BackgroundTransparency=0.97}):Play()end end)at:ConnectFor(au
,au.main.MouseLeave,function()g.tweenService:Create(au.stroke,av,{Transparency=aw.ElementStrokeTransparency,Color=aw.
ElementStroke}):Play()g.tweenService:Create(au.title,av,{TextColor3=aw.ContentColor}):Play()if au.hoverOverlay then g.
tweenService:Create(au.hoverOverlay,av,{BackgroundTransparency=1}):Play()end end)end function j._runGuarded(at,au,av,...
)if au.locked then return end local aw=table.pack(...)task.spawn(function()local ax,ay=pcall(function()return av(table.
unpack(aw,1,aw.n))end)if ax or au._errored then return end au._errored=true local az,aA=au.flashTarget or au.main,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)g.tweenService:Create(az,aA,{BackgroundColor3=at.
theme.ErrorColor}):Play()g.tweenService:Create(au.stroke,aA,{Color=at.theme.ErrorStrokeColor}):Play()if au.title then au
.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
au.__type} component named '{au.name}':`)ak.print(ay)task.wait(1)if au.title then au.title.Text=aj.resolve(au.name)end g
.tweenService:Create(az,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()g.tweenService:Create(au.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=at.theme.ElementStroke}):Play()au._errored=false end)end function j.StyleElementBody(at,au)
at:Create('UIGradient',{Rotation=270,Parent=au},{Color='ElementGradient'})at:Create('UICorner',{Parent=au},{CornerRadius
='ElementCornerRadius'})return at:Create('UIStroke',{Transparency=1,Parent=au},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function j._buildCompactRow(at,au,av,aw)local ax=at:Create('Frame',{Name=av,Size=UDim2.
fromOffset(0,s),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=au.tabPage},{BackgroundTransparency='ElementTransparency'})local ay=at
:StyleElementBody(ax)at:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=ax})at:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.
UIFlexAlignment.Fill,Parent=ax})local az=at:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,s),BorderSizePixel=0,
TextTransparency=1,ZIndex=aw or 1,Parent=ax})at:Create('UICorner',{Parent=az},{CornerRadius='ElementCornerRadius'})
return ax,ay,az end function j.StyleElementPanel(at,au)at:Create('UIGradient',{Rotation=270,Parent=au},{Color=
'ElementGradient'})at:Create('UICorner',{Parent=au},{CornerRadius='ElementCornerRadius'})local av=at:Create('UIStroke',{
Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=au})at:Create('UIGradient',{Rotation=270,Parent=av},{Color=
'ElementStrokeGradient'})return av end function j._reveal(at,au,av,aw,ax)if not au then return end if aw then g.
tweenService:Create(au,ax or k,av):Play()else for ay,az in av do au[ay]=az end end end function j._revealCommon(at,au,av
)at:_reveal(au.stroke,{Transparency=at.theme.ElementStrokeTransparency},av)at:_reveal(au.title,{TextTransparency=0},av)
at:_reveal(au.main,{BackgroundTransparency=at.theme.ElementTransparency or 0},av)if au.iconLabel then at:_reveal(au.
iconLabel,{ImageTransparency=0},av)end if au.descriptor then at:_reveal(au.descriptor.titleLabel,{TextTransparency=0.7},
av)end end function j._hideCommon(at,au,av)at:_reveal(au.stroke,{Transparency=1},av)at:_reveal(au.title,{
TextTransparency=1},av)at:_reveal(au.main,{BackgroundTransparency=1},av)if au.iconLabel then at:_reveal(au.iconLabel,{
ImageTransparency=1},av)end if au.descriptor then at:_reveal(au.descriptor.titleLabel,{TextTransparency=1},av)end end
function j._collapsedRect(at)local au=if at.showIconOnly then m else l if at._collapsedPosition then return at.
_collapsedPosition,au end local av=UDim2.new(n.X.Scale,n.X.Offset,n.Y.Scale,n.Y.Offset+au.Y.Offset/2)return av,au end
function j._interactive(at)return not at.animating and not at.hidden end function j._settled(at)return not at.hidden and
not at._revealing end function j.Connect(at,au,av)local aw=au:Connect(av)table.insert(at.connections,aw)return aw end
function j.ConnectFor(at,au,av,aw)local ax=at:Connect(av,aw)au.connections=au.connections or{}table.insert(au.
connections,ax)return ax end function j.Disconnect(at,au)if not au then return end local av=table.find(at.connections,au
)if av then table.remove(at.connections,av)end au:Disconnect()end function j.DestroySubtree(at,au)if not au then return
end local av={[au]=true}for aw,ax in au:GetDescendants()do av[ax]=true end for aw=#at.instances,1,-1 do local ax=at.
instances[aw]if av[ax]then table.remove(at.instances,aw)at.themeProperties[ax]=nil at.localeProperties[ax]=nil end end
au:Destroy()end function j.DisconnectMany(at,au,av)if not av or#av==0 then return end local aw={}for ax,ay in av do aw[
ay]=true ay:Disconnect()end local function ax(ay)if not ay then return end local az=0 for aA=1,#ay do local aB=ay[aA]if
not aw[aB]then az+=1 ay[az]=aB end end for aA=#ay,az+1,-1 do ay[aA]=nil end end ax(at.connections)if au and au~=at then
ax(au.connections)end end function j.DestroySubtrees(at,au)if not au or#au==0 then return end local av={}for aw,ax in au
do av[ax]=true for ay,az in ax:GetDescendants()do av[az]=true end end local aw=0 for ax=1,#at.instances do local ay=at.
instances[ax]if av[ay]then at.themeProperties[ay]=nil at.localeProperties[ay]=nil else aw+=1 at.instances[aw]=ay end end
for ax=#at.instances,aw+1,-1 do at.instances[ax]=nil end for ax,ay in au do ay:Destroy()end end function j.Unload(at)at.
unloaded=true al.teardown()al.releaseContainer(at.screenGui)if at._liveTween then at._liveTween:Cancel()at._liveTween=
nil end for au=#at.connections,1,-1 do at.connections[au]:Disconnect()end for au=#at.instances,1,-1 do at.instances[au]:
Destroy()end table.clear(at.connections)table.clear(at.instances)table.clear(at.themeProperties)table.clear(at.
localeProperties)table.clear(at.controls)table.clear(at.tabs)end return j end)()end,[32]=function()local aa,ab,ac=a(32)
local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,22,46)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},
ShadowColor=Color3.fromRGB(12,6,22),ElementStroke=Color3.fromRGB(54,42,74),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(32,24,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(36,28,54)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,54))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(72,58,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,72,124)),ColorSequenceKeypoint.new(1
,Color3.fromRGB(72,58,104))},ElementStrokeHover=Color3.fromRGB(84,68,118),TabBackground=ColorSequence.new(Color3.
fromRGB(54,42,80),Color3.fromRGB(34,26,52)),TabStroke=ColorSequence.new(Color3.fromRGB(88,70,128),Color3.fromRGB(54,42,
80)),SliderBackground=Color3.fromRGB(46,36,68),SliderBackgroundHover=Color3.fromRGB(60,48,90),SliderProgress=
ColorSequence.new(Color3.fromRGB(170,112,248),Color3.fromRGB(138,80,224)),AccentColor=Color3.fromRGB(168,110,246),
AccentStroke=Color3.fromRGB(200,154,255),ToggleKnobOff=Color3.fromRGB(224,214,236),StatBackground=Color3.fromRGB(24,18,
38),DropdownHighlight=Color3.fromRGB(168,110,246),NeutralButton=Color3.fromRGB(46,36,68),NeutralButtonHover=Color3.
fromRGB(60,48,90),NeutralButtonStroke=Color3.fromRGB(140,116,190)}end)()end,[33]=function()local aa,ab,ac=a(33)local ad
return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(12,16,34)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(20,26,50)),ColorSequenceKeypoint.new(1,Color3.fromRGB(28,36,66))},
ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=Color3.fromRGB(44,52,82),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,38,66)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(70,82,124)),ColorSequenceKeypoint.new(1
,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.fromRGB(64,76,116),TabBackground=ColorSequence.new(Color3.
fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=ColorSequence.new(Color3.fromRGB(78,92,140),Color3.fromRGB(48,58,
92)),SliderBackground=Color3.fromRGB(40,48,78),SliderBackgroundHover=Color3.fromRGB(54,64,100),SliderProgress=
ColorSequence.new(Color3.fromRGB(64,132,248),Color3.fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,120,240),
AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3.fromRGB(196,206,232),StatBackground=Color3.fromRGB(20,26,48
),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton=Color3.fromRGB(40,48,78),NeutralButtonHover=Color3.fromRGB(
54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}end)()end,[34]=function()local aa,ab,ac=a(34)local ad return(
function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),ElementStroke=
Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,255,
255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=
Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),
SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.
SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,
DarkToggleOverlay=true,ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(50,50,50),ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,
255,255),TitlingColor=Color3.fromRGB(255,255,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.
fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),
SliderHandle=Color3.fromRGB(255,255,255),PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),
ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=
Color3.fromRGB(255,255,255),FieldTransparency=0.9,FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(
178,178,178),SurfaceStroke=Color3.fromRGB(255,255,255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.
fromRGB(54,54,54),NeutralButtonStroke=Color3.fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=
Color3.fromRGB(240,75,75)}end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
32,27,23)),ColorSequenceKeypoint.new(1,Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=
Color3.fromRGB(54,46,40),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(88,76,64)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.
fromRGB(84,72,60),TabBackground=ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=
ColorSequence.new(Color3.fromRGB(92,78,66),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),
SliderBackgroundHover=Color3.fromRGB(62,52,44),SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.
fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3
.fromRGB(232,224,214),StatBackground=Color3.fromRGB(26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton
=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}
end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(236,241,245))},ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,
ElementStroke=Color3.fromRGB(218,224,228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),
ElementStrokeGradient=ColorSequence.new(Color3.fromRGB(224,230,234),Color3.fromRGB(232,238,242)),
ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(0,176,208),
DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=ColorSequence.new(Color3.fromRGB(0,176,208),
Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206,230),Color3.fromRGB(0,160,196)),
SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,220,224),SliderProgress=
ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.fromRGB(200,206,210),
AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,StatBackground=Color3.
fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210),
ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=0
,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,210
,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number|boolean)?,themeTab:boolean?,
homeTab:boolean?,discordReminder:boolean?,discordInvite:string?,showName:string?,showIcon:(string|number)?,showIconOnly:
boolean?,sidebarLayout:boolean?,profile:string?,configuration:WindowConfiguration?,fallbackFont:(Font|Enum.Font)?,locale
:string?,translations:Translations?,translator:Translator?}export type TabProps={name:string?,icon:(string|number)?}
export type TagProps={text:string?,title:string?,icon:(string|number)?,color:Color3?,order:number?}export type
SectionProps={name:string?,icon:(string|number)?}export type TextProps={name:string?,text:string?,icon:(string|number)?}
export type DividerProps={text:string?,spacing:number?,line:boolean?}export type GroupProps={direction:string?}export
type ButtonProps={name:string?,description:string?,icon:(string|number)?,callback:(()->())?}export type ToggleProps={
name:string?,description:string?,icon:(string|number)?,flag:string?,value:boolean?,forgetState:boolean?,callback:((value
:boolean)->())?}export type SliderProps={name:string?,description:string?,icon:(string|number)?,flag:string?,range:{
number}?,increment:number?,value:number?,suffix:string?,minimal:boolean?,forgetState:boolean?,callback:((value:number,
dragging:boolean)->())?}export type DropdownProps={name:string?,description:string?,icon:(string|number)?,flag:string?,
options:{string}?,value:(string|{string})?,multiSelect:boolean?,placeholder:string?,forgetState:boolean?,callback:((
value:any)->())?}export type InputProps={name:string?,description:string?,icon:(string|number)?,flag:string?,value:
string?,placeholder:string?,numeric:boolean?,clearOnFocus:boolean?,forgetState:boolean?,callback:((value:string)->())?}
export type KeybindProps={name:string?,description:string?,icon:(string|number)?,flag:string?,value:(EnumItem|string)?,
forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,callback:((value:EnumItem|boolean)->())?,
onChanged:((key:EnumItem)->())?}export type ColorPickerProps={name:string?,description:string?,icon:(string|number)?,
flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value:Color3,alpha:number)->())?}export type
StatProps={name:string?,description:string?,icon:(string|number)?,prefix:string?,suffix:string?,value:number?,display:
string?,compact:boolean?,changeMode:string?,changeBaseline:string?,numberEasing:boolean?}export type ProgressProps={name
:string?,description:string?,icon:(string|number)?,range:{number}?,value:number?,steps:number?,text:string?,format:((
value:number,min:number,max:number)->string)?,showValue:boolean?,indeterminate:boolean?}export type ConsoleProps={name:
string?,description:string?,text:string?,height:number?,follow:boolean?,maxLines:number?}export type NotifyProps={title:
string?,content:string?,icon:(string|number)?,duration:number?}export type ToastProps={title:string?,subtitle:string?,
subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,duration:number?,position:'Top'|'Bottom'?}
export type PopupBox={title:string?,description:string?,icon:(string|number)?}export type PopupOption={text:string?,
style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:string?,icon:(string|number)?,content:
string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type Moveable={MoveTo:(self:any,index:
number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown:(self:any)->()}export
type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->boolean}export type Button=
Moveable&Lockable&{}export type Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,value:boolean,skipCallback:
boolean?)->()}export type Slider=Moveable&Lockable&{value:number,Set:(self:Slider,value:number,skipCallback:boolean?)->(
)}export type Dropdown=Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:string|{string},skipCallback:boolean?
)->(),Refresh:(self:Dropdown,options:{string})->(),Add:(self:Dropdown,option:string)->(),Remove:(self:Dropdown,option:
string)->()}export type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:string,skipCallback:boolean?)->()}
export type Keybind=Moveable&Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string,skipChanged:boolean?)->()}
export type ColorPicker=Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,value:Color3|string,
skipCallback:boolean?)->(),SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export type Stat=Moveable&
{value:number,Set:(self:Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export type Progress=Moveable
&{value:number,Set:(self:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(self:Progress)->number,
SetRange:(self:Progress,min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),SetIndeterminate:(self:
Progress,state:boolean)->(),Remove:(self:Progress)->()}export type Console=Moveable&{Set:(self:Console,text:string)->(),
Append:(self:Console,line:string)->(),Clear:(self:Console)->(),Get:(self:Console)->string,Copy:(self:Console)->boolean,
SetHeight:(self:Console,height:number)->(),Remove:(self:Console)->()}export type Section=Moveable&{}export type
TabSection={Remove:(self:TabSection)->()}export type Text=Moveable&{name:string,text:string,Set:(self:Text,text:string
)->(),SetTitle:(self:Text,title:string)->()}export type Divider=Moveable&{text:string,Set:(self:Divider,text:string?)->(
)}export type Tag={Set:(self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?
)->(),SetIcon:(self:Tag,icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}
export type Group=Moveable&{CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:
ToggleProps)->Toggle,CreateSwitch:(self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,
CreateSlider:(self:Group,props:SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown?,
CreateSection:(self:Group,props:SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,CreateDivider:(
self:Group,props:DividerProps?)->Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Tab={Select:(
self:Tab,noAnimation:boolean?)->(),Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),CreateButton:(self
:Tab,props:ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:
ToggleProps)->Toggle,CreateSlider:(self:Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->
Dropdown,CreateInput:(self:Tab,props:InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,
CreateColorPicker:(self:Tab,props:ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,
CreateProgress:(self:Tab,props:ProgressProps)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,
CreateSection:(self:Tab,props:SectionProps)->Section,CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(self:Tab
,props:DividerProps?)->Divider,CreateGroup:(self:Tab,props:GroupProps?)->Group}export type Window={unloaded:boolean,
Flags:{[string]:any},CreateTab:(self:Window,props:TabProps)->Tab,CreateSection:(self:Window,props:SectionProps)->
TabSection,CreateTag:(self:Window,props:TagProps)->Tag,Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,
props:ToastProps)->(),Popup:(self:Window,props:PopupProps)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),
ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(
self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:string)->(),SetTranslator:(self:Window,translator:
Translator?)->(),RegisterTranslations:(self:Window,translations:Translations)->(),Save:(self:Window,name:string?)->
boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:
string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:Window,flag:string)->any,Set:(self:Window,flag:string,
value:any)->boolean,Unload:(self:Window)->()}export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->
Window}return{}end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)local ae,af=ac(ab.Parent.
variables),{}af.enabled=false type HapticTypes={click:Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:
HapticTypes,ah,ai={},pcall(function()Instance.new'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,
notify=Enum.HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.HapticEffectType]:Instance},ak:Instance?={
}function af.setContainer(al:Instance?)ak=al end function af.releaseContainer(al:Instance?)if al==nil or ak==al then ak=
nil end end local function al():Instance if ak and ak.Parent then return ak end return ae.guiContainer end
local function am(an:Enum.HapticEffectType):Instance?local ao=aj[an]if ao and ao.Parent then return ao end local ap,aq=
pcall(Instance.new,'HapticEffect')if not ap then return nil end local ar=aq::any ar.Type=an local as=pcall(function()aq.
Parent=al()end)if not as then aq:Destroy()return nil end aj[an]=aq return aq end local function an(ao:Enum.
HapticEffectType?)if not ao or not af.enabled then return end local ap=am(ao)if ap then local aq=ap::any pcall(aq.Play,
ap)end end function af.click()an(ag.click)end function af.notify()an(ag.notify)end function af.setEnabled(ao:boolean?)af
.enabled=ao and true or false if not af.enabled then af.teardown()end end function af.teardown()for ao,ap in aj do
pcall(ap.Destroy,ap)aj[ao]=nil end end return af end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(
...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|string export type AssetDownloadUrl=
string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method
:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::
AssetDownloadUrl,RoProxyDownloadUrl='https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag
ag.__type='assetResolver'type AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,
contentDownloadUrl:AssetDownloadUrl,pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{
resolve:(self:AssetResolver,value:unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,
cacheKey:CacheKey?,forced:boolean?)->string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->
string?}local ah=8 function ag.new(ai:boolean?,aj:AssetDownloadUrl?):AssetResolver local ak:{[CacheKey]:string}?=if ai
then{}else nil local al=setmetatable({contentCache=ak,contentCacheOrder=if ai then{}::{CacheKey}else nil,
contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any
return al end function ag.resolve(ai:AssetResolver,aj:unknown):ResolvedAsset?if type(aj)=='number'then return aj end if
type(aj)~='string'then return nil end if string.sub(aj,1,11)=='rbxasset://'or string.sub(aj,1,11)=='rbxthumb://'then
return aj end local ak=tonumber(string.match(aj,'^rbxassetid://(%d+)$'))if ak then return ak end return nil end
local function ai(aj:unknown):boolean if type(aj)~='table'then return false end local ak=aj::{Body:unknown,StatusCode:
unknown,Success:unknown}local al=ak.Body if type(al)~='string'or#al==0 then return false end if type(ak.StatusCode)==
'number'then local am=ak.StatusCode::number return am>=200 and am<300 end if type(ak.Success)=='boolean'then return ak.
Success::boolean end return false end function ag.getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:
boolean?):string?local an=aj.contentCache if al~=nil and an and not am then local ao=an[al]if ao then return ao end end
local ao=aj.pendingRequests if al~=nil then local ap=ao[al]if ap then table.insert(ap,coroutine.running())return
coroutine.yield()end ao[al]={}end local ap,aq:string?=(ae.getRequestFn())if not ap then af.warn
'No request function available to download asset content.'else local ar,as=pcall(ap,{Url=ak,Method='GET'}::
AssetRequestPayload)if ar and ai(as)then local at=(as::{Body:string}).Body aq=at if al~=nil and an then local au=aj.
contentCacheOrder if au and an[al]==nil then table.insert(au,al)local av=if#au>ah then table.remove(au,1)else nil if av
~=nil then an[av]=nil end end an[al]=at end elseif not am then af.warn('Failed to download asset content for url: '..
tostring(ak))end end if al~=nil then local ar=ao[al]ao[al]=nil if ar then for as,at in ar do coroutine.resume(at,aq)end
end end return aq end function ag.getAssetContentFromId(aj:AssetResolver,ak:AssetId,al:boolean?):string?local am=aj:
resolve(ak)if not am or type(am)~='number'then af.warn('Invalid asset id: '..tostring(am))return nil end local an=string
.format(aj.contentDownloadUrl,am)return aj:getAssetContentFromUrl(an,am,al)end return ag end)()end,[42]=function()local
aa,ab,ac=a(42)local ad return(function(...)local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+
0.587*af.G+0.114*af.B return if ag>0.5 then Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.
toColorSequence(af:Color3|ColorSequence):ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.
new(af)end function ae.contrastText(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then
Color3.fromRGB(20,20,20)else Color3.fromRGB(255,255,255)end return ae end)()end,[43]=function()local aa,ab,ac=a(43)local
ad return(function(...)local ae={}ae.fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out)ae.icons={close=83277910885129,minimise=108115485663409,maximise=
88738500661569,settings=129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=
91452555903853,colorpicker=91452555903853,banner=111263549366178,config=125823673784681,rayfield=80387863064905,palette=
10734910430,home=10723424646,discord=10734888000}ae.accent={on=Color3.fromRGB(23,153,110),onStroke=Color3.fromRGB(32,201
,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=
ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=ColorSequence.new(Color3.fromRGB(
172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75),Color3.fromRGB(244,67,67))},
neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.
fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65,bottomFade=100,
notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae.displayOrder={
window=99999,banner=100000,popup=100001}return ae end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(
...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return af:FromValue(ag)end)if ah and ai then
return ai end local aj,ak=pcall(function()return af:GetEnumItems()end)if not aj then return nil end for al,am in ak do
if am.Value==ag then return am end end return nil end return ae end)()end,[45]=function()local aa,ab,ac=a(45)local ad
return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService':IsStudio()local ah=not ag
and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)=='function'and typeof(isfolder)==
'function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(delfile)=='function'and typeof(
delfolder)=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,aj)end function af.readfile(ai:
string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.appendfile(ai:string,aj:string)
appendfile(ai,aj)end end function af.isfile(ai:string):boolean return isfile(ai)end function af.delfile(ai:string)
delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function af.makefolder(ai:string)
makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.delfolder(ai:string)
delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.getService
'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.gmatch(ak,'[^/]+')do table.insert(al
,am)end return al end local function ak(al:{string},am:boolean):Instance?local an:Instance=ai for ao=1,#al-1 do local ap
=an:FindFirstChild(al[ao])if not ap then if not am then return nil end local aq=Instance.new'Folder'aq.Name=al[ao]aq.
Parent=an ap=aq end an=ap::Instance end return an end local function al(am:Instance?):StringValue?if am and am:IsA
'StringValue'then return am end return nil end function af.writefile(am:string,an:string)local ao=aj(am)assert(#ao>0,
'Invalid path')local ap=ak(ao,true)assert(ap,'Invalid path')local aq=ao[#ao]local ar=ap:FindFirstChild(aq)local as=al(ar
)if as then as.Value=an else if ar then ar:Destroy()end local at=Instance.new'StringValue'at.Name=aq at.Value=an at.
Parent=ap end end function af.readfile(am:string):string local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false
)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..am)
return aq.Value end function af.isfile(am:string):boolean local an=aj(am)if#an==0 then return false end local ao=ak(an,
false)if not ao then return false end return al(ao:FindFirstChild(an[#an]))~=nil end function af.listfiles(am:string):{
string}local an,ao:Instance=aj(am),ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if not ar or not ar:IsA'Folder'
then error('Folder not found: '..am)end ao=ar end local ap:{string}={}for aq,ar in ao:GetChildren()do table.insert(ap,am
..'/'..ar.Name)end return ap end function af.delfile(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an
,false)assert(ao,'File not found: '..am)local ap=ao:FindFirstChild(an[#an])local aq=al(ap)assert(aq,'File not found: '..
am)aq:Destroy()end function af.makefolder(am:string)local an=aj(am)if#an==0 then return end local ao:Instance=ai for ap,
aq in an do local ar=ao:FindFirstChild(aq)if not ar then local as=Instance.new'Folder'as.Name=aq as.Parent=ao ar=as end
ao=ar::Instance end end function af.isfolder(am:string):boolean local an=aj(am)if#an==0 then return false end local ao:
Instance=ai for ap,aq in an do local ar=ao:FindFirstChild(aq)if not ar or not ar:IsA'Folder'then return false end ao=ar
end return true end function af.delfolder(am:string)local an=aj(am)assert(#an>0,'Invalid path')local ao=ak(an,false)
assert(ao,'Folder not found: '..am)local ap=ao:FindFirstChild(an[#an])assert(ap and ap:IsA'Folder','Folder not found: '
..am)ap:Destroy()end end if af.writefile and not af.appendfile then function af.appendfile(ai:string,aj:string)local ak=
if af.isfile(ai)then af.readfile(ai)else nil af.writefile(ai,if ak then ak..aj else aj)end end function af.ensureFolder(
ai:string)if not af.isfolder(ai)then af.makefolder(ai)end end function af.ensureDir(ai:string)local aj=''for ak in
string.gmatch(ai,'[^/]+')do aj=if aj==''then ak else aj..'/'..ak if not af.isfolder(aj)then af.makefolder(aj)end end end
return af end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),'Rayfield',{}ah.__index=ah export type FileSystemManager={root:string,assets:string,
getPath:(self:FileSystemManager,subpath:string?)->string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->
string,getRootFolder:(self:FileSystemManager)->string}function ah.new(ai:string?):FileSystemManager local aj=ai or ag
local ak=setmetatable({root=aj,assets=aj..'/Assets'},ah)::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.
assets)return ak end function ah.getPath(ai,aj:string?):string return af.join(ai.root,aj)end function ah.getAssetsFolder
(ai,aj:string?):string if aj then local ak=af.join(ai.assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets
end function ah.getRootFolder(ai):string return ai.root end return ah end)()end,[47]=function()local aa,ab,ac=a(47)local
ad return(function(...)local ae,af,ag={},2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#
ai do aj=bit32.bxor(aj,string.byte(ai,ak))local al=aj%65536 local am=(aj-al)/65536 aj=(((am*ag)%65536)*65536+al*ag)%
4294967296 end return aj end function ae.deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:
string):string return aj:sub(1,1):upper()..aj:sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.
format('Flag%08x',ah(ai))end return aj end return ae end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(
function(...)local ae=ac(ab.Parent.services)local af,ag,ah,ai,aj,ak=ae.getService'HttpService',ae.getService'RunService'
,ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab.Parent.log),ac(ab.Parent.path)local function al(am:unknown):
string?local an,ao=pcall(function()return af:JSONEncode(am)end)if an and type(ao)=='string'then return ao else aj.warn(
'Failed to encode JSON:',ao)return nil end end local function am(an:string):unknown?local ao,ap=pcall(function()return
af:JSONDecode(an)end)if ao then return ap else aj.warn('Failed to decode JSON:',ap)return nil end end local an={}an.
__type='fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}export
type FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:FontManifest,
loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function ao(ap:unknown):FontManifest?local aq=ap::any if type(aq)~='table'or type(aq.name)~='string'or type(aq.
faces)~='table'then return nil end aq.name=ak.sanitizeFile(aq.name)if#aq.name==0 or#aq.faces==0 then return nil end for
ar,as in aq.faces do if type(as)~='table'or type(as.name)~='string'or type(as.assetId)~='string'then return nil end as.
name=ak.sanitizeFile(as.name)if#as.name==0 then return nil end end return aq::FontManifest end local ap={'\0\1\0\0',
'OTTO','true','ttcf','wOFF','wOF2'}local function aq(ar:string):boolean for as,at in ap do if string.sub(ar,1,#at)==at
then return true end end return false end local ar=getfenv()local function as(at:Enum.FontWeight,au:Enum.FontStyle):
string return tostring(at)..'|'..tostring(au)end local function at(au:unknown):number?if type(au)=='number'then return
au end if type(au)=='string'then return tonumber(au)end return nil end function an.__index(au:FontManagerState,av:
unknown):unknown local aw=(an::any)[av]if aw~=nil then return aw end local ax=at(av)if not ax then return nil end local
ay=au.fontCache if ay then local az=ay[ax]if az then local aA=as(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local aB=
az.variants and az.variants[aA]if aB then return aB end for aC,aD in pairs(az.variants or{})do return aD end end end
return nil end function an.new(au:string,av:boolean?,aw:boolean?,ax:ai.AssetDownloadUrl?,ay:FontResolverOptions?):
FontManager local az=ay or{saveToDisk=true,skipCache=not aw or false,fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}
local aA=setmetatable({rootFolder=au,fontCache=if aw then{}::FontCache else nil,assetResolver=ai.new(aw,ax),
defaultOptions=az,_debug=av or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,an)::any pcall(ah.ensureFolder,
au)return aA end local function au(av:FontManager,aw:number,ax:Enum.FontWeight,ay:Enum.FontStyle,az:string):Font?local
aA=av.rootFolder..'/'..aw..'.json'if typeof(ah.isfile)~='function'then return av.defaultOptions.fallbackFont end local
aB,aC:string?=false if ag:IsStudio()and av._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]aC=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(aA)then local aD,aE=pcall(ah.readfile,aA)aC=aD and aE or nil else aC=av.assetResolver:
getAssetContentFromId(aw,false)aB=aC~=nil end local aD:FontManifest?if aC then local aE,b=pcall(am,aC)if aE and b then
aD=ao(b)else if av._debug then aj.warn('Failed to parse font manifest for font id: '..tostring(aw)..'. Error: '..
tostring(b))end end else return av.defaultOptions.fallbackFont end if not aD then if av._debug then aj.warn(
'Font manifest is nil for font id: '..tostring(aw))end pcall(ah.delfile,aA)return av.defaultOptions.fallbackFont end if
aB and aC then pcall(ah.writefile,aA,aC)end local aE,b=av.rootFolder..'/'..aD.name,true if not pcall(ah.ensureFolder,aE)
then return av.defaultOptions.fallbackFont end for c,d in ipairs(aD.faces)do local e=aE..'/'..d.name:gsub(' ','-')..
'.ttf'if ah.isfile(e)then local f,g=pcall(ah.readfile,e)if not f or type(g)~='string'or not aq(g)then pcall(ah.delfile,e
)end end if not ah.isfile(e)then local f=av.assetResolver:resolve(d.assetId)local g=if f~=nil then av.assetResolver:
getAssetContentFromId(f,false)else nil if not g or not aq(g)then b=false if av._debug then aj.warn(
'Font face content is missing or not a font for font id: '..tostring(aw)..', face: '..d.name)end continue end pcall(ah.
writefile,e,g)end local f,g=pcall(ar.getcustomasset,e)if f and type(g)=='string'then aD.faces[c].assetId=g if av._debug
then aj.print('Loaded font face for id: '..tostring(aw)..', face: '..d.name)end else b=false if av._debug then aj.warn(
'Failed to load font face for id: '..tostring(aw)..', face: '..d.name)end end end if not b then return av.defaultOptions
.fallbackFont end local c=al(aD)if not c or not pcall(ah.writefile,aE..'/manifest.json',c)then return av.defaultOptions.
fallbackFont end local d,e=pcall(ar.getcustomasset,aE..'/manifest.json')if not d or not e then if av._debug then aj.
warn('Failed to load font manifest for id: '..tostring(aw))end return av.defaultOptions.fallbackFont end local f,g=
pcall(Font.new,e::any,ax,ay)if not f or not g then if av._debug then aj.warn('Failed to load font for id: '..tostring(aw
))end return av.defaultOptions.fallbackFont end local h=av.fontCache if h then h[aw]={customId=e,manifest=aD,
loadedFromDisk=true,variants={[az]=g}}if av._debug then aj.print('Cached font for id: '..tostring(aw))end end return g
end function an.loadFont(av:FontManager,aw:(number|string)?,ax:Enum.FontWeight?,ay:Enum.FontStyle?,az:boolean?,aA:
boolean?):Font?if az==nil then az=av.defaultOptions.saveToDisk end if aA==nil then aA=av.defaultOptions.skipCache end
local aB,aC=ax or Enum.FontWeight.Regular,ay or Enum.FontStyle.Normal local aD,aE=as(aB,aC),av.assetResolver:resolve(aw)
local b=at(aE)if not b then aj.warn('Invalid font id: '..tostring(aw))return av.defaultOptions.fallbackFont end local c=
av.fontCache if c and not aA then local d=c[b]if d then local e=d.variants and d.variants[aD]if e then if av._debug then
aj.print('Loaded font from cache for id: '..tostring(b))end return e end local f,g=pcall(Font.new,d.customId::any,aB,aC)
if f and g then d.variants=d.variants or{}d.variants[aD]=g if av._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(b))end return g else if av._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(b))end c[b]=nil return av.defaultOptions.fallbackFont end end end if
not az then if av._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end return
av.defaultOptions.fallbackFont end local d,e=av._pendingLoads,tostring(b)..'|'..aD local f=d[e]if f then table.insert(f,
coroutine.running())return coroutine.yield()end d[e]={}local g,h=pcall(au,av,b,aB,aC,aD)local i=if g then h else av.
defaultOptions.fallbackFont f=d[e]d[e]=nil if f then for j,k in f do coroutine.resume(k,i)end end return i end function
an.resolve(av:FontManager,aw:number|string):Font?local ax=at(aw)if not ax then return nil end local ay=av.fontCache if
ay then local az=ay[ax]if az then if av._debug then aj.print('Resolved font for id: '..tostring(ax))end for aA,aB in
pairs(az.variants or{})do return aB end end end return nil end function an.getFontFromId(av:FontManager,aw:number|string
):Font?return av:resolve(aw)end return an end)()end,[49]=function()local aa,ab,ac=a(49)local ad return(function(...)
local ae,af,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.
textHeight=af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.
toColorSequence=ag.toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[50]=function()local aa,ab,ac=a(
50)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type AvatarCallback=ae.
AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=nil::((unknown)->()
)?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}local ah,ai:{[string]
:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(ak:unknown):number?if type(ak)=='number'
then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,'^rbxassetid://(%d+)$'))end return nil end
local function ak(al:unknown):string if ag.onBlock then ag.onBlock(al)end return''end function ag.preload(al:
PreloadCallback?):(boolean,number)ah=false return ae.preload(function(am)ah=true table.clear(ag.pending)if al then al(am
)end end)end function ag.avatar(al:number,am:AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={
al}&w=48&h=48`end return ae.avatar(al,am)end function ag.assign(al:Instance,am:string,an:unknown)local ao=al::any if not
ai[am]then ao[am]=an return end ao[am]=ag.resolve(an)if af.secureMode and not ah then local ap=aj(an)if ap and not ag.
rewrites[ap]then local aq=ag.pending[ap]if not aq then aq=setmetatable({},{__mode='k'})::any ag.pending[ap]=aq end local
ar=aq[al]if not ar then ar={}aq[al]=ar end ar[am]=true end end end ae.onCached=function(al:number)local am=ag.pending[al
]if not am then return end local an=ag.rewrites[al]if an then for ao,ap in am do if ao.Parent then local aq=ao::any for
ar in ap do aq[ar]=an end end end end ag.pending[al]=nil end function ag.resolve(al:unknown):string if al==nil or al==0
or al==''then return''end if type(al)=='string'then if string.sub(al,1,11)=='rbxasset://'then return al end if string.
sub(al,1,11)=='rbxthumb://'then return if af.secureMode then ak(al)else al end end local am:number?if type(al)=='number'
then am=al elseif type(al)=='string'then am=tonumber(string.match(al,'^rbxassetid://(%d+)$'))end local an=if am then ag.
rewrites[am]else nil if an then return an end if af.secureMode then return ak(al)end if type(al)=='number'then return
'rbxassetid://'..al end if type(al)=='string'then return al end return ak(al)end return ag end)()end,[51]=function()
local aa,ab,ac=a(51)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),ac(ab.
Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:string}export type CacheSettledCallback=(
failed:number)->()export type PreloadCallback=CacheSettledCallback export type AvatarCallback=(uri:string)->()export
type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,imageUrl:string?}export type
ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,am,an,ao,ap:{[number]:string}={},ag.fileSystemManager:
getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for aq,ar
in ah.icons do local as=ar::number ap[as]=am..tostring(as)..'.png'end local aq=0 for ar in ap do aq+=1 end ai.rewrites={
}::RewriteMap ai.onCached=nil::OnCachedCallback?local ar='\137PNG\r\n\26\n'local function as(at:string,au:string):string
?if type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(at)
then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local av=al:getAssetContentFromUrl(au,at,false)if not av or
string.sub(av,1,8)~=ar then return nil end if not pcall(ae.writefile,at,av)then return nil end end local av,aw=pcall(
getfenv().getcustomasset,at)return if av and type(aw)=='string'then aw else nil end function ai.logo():string?local at=
getfenv()if type(at.getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end local au,av=ac(ab.
Parent.logoImage),0 for aw=1,#au,7 do av=(av*31+string.byte(au,aw))%2147483647 end local aw,ax=(af.join(ak,string.
format('logo_%d_%d.png',#au,av)))if ae.isfile(aw)then local ay,az=pcall(ae.readfile,aw)ax=if ay then az else nil end if
ax~=au then pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)if not pcall(ae.writefile,aw,au)then return nil end end
local ay,az=pcall(at.getcustomasset,aw)return if ay and type(az)=='string'then az else nil end local function at(au:
number):string return af.join(ak,'avatar_'..tostring(au)..'.png')end local function au(av:string):string?local aw,ax=
pcall(function()return ag.httpService:JSONDecode(av)end)if not aw or type(ax)~='table'then return nil end local ay=(ax::
ThumbnailResponse).data if type(ay)~='table'then return nil end local az=ay[1]if type(az)~='table'then return nil end
local aA=az::ThumbnailEntry if aA.state=='Completed'and type(aA.imageUrl)=='string'then return aA.imageUrl end return
nil end local function av(aw:number):string?local ax:string?for ay=1,4 do local az=al:getAssetContentFromUrl(string.
format(ao,aw,an,an),'avatar:'..tostring(aw),ay>1)if az then local aA=au(az)if aA then ax=aA break end end if ay<4 then
task.wait(0.3)end end if not ax then return nil end return as(at(aw),ax)end local aw:{[number]:{AvatarCallback}},ax:{[
number]:boolean}={},{}function ai.preload(ay:PreloadCallback?):(boolean,number)local az=getfenv()if type(az.
getcustomasset)~='function'or typeof(ae.isfile)~='function'then if ay then task.defer(ay,aq)end return false,aq end
local aA=ai.rewrites table.clear(aA)local function aB()if not ay then return end local aC=0 for aD in ap do if not aA[aD
]then aC+=1 end end ay(aC)end local aC,aD,aE=0,0,true for b,c in ap do local d,e:string?=(af.join(ak,tostring(b)..'.png'
))if ae.isfile(d)then local f,g=pcall(az.getcustomasset,d)e=if f and type(g)=='string'then g else nil end if e then aA[b
]=e else aD+=1 aC+=1 task.spawn(function()local f=as(d,c)if f then aA[b]=f if ai.onCached then pcall(ai.onCached,b)end
end aC-=1 if aC==0 and not aE then aB()end end)end end aE=false if aC==0 then aB()end return aD==0,aD end function ai.
avatar(ay:unknown,az:AvatarCallback?):string if type(ay)~='number'then return''end if typeof(ae.isfile)~='function'then
return''end local aA=at(ay)if ae.isfile(aA)then local aB,aC=pcall(getfenv().getcustomasset,aA)if aB and type(aC)==
'string'then return aC end end if ax[ay]then return''end local aB=aw[ay]if aB then if az then table.insert(aB,az)end
return''end if az then aw[ay]={az}task.spawn(function()local aC,aD=av(ay),aw[ay]aw[ay]=nil if not aC then ax[ay]=true
return end if aD then for aE,b in aD do pcall(b,aC)end end end)end return''end return ai end)()end,[52]=function()local
aa,ab,ac=a(52)local ad return(function(...)local ae,af={},64 local ag,ah,ai=af-1,38,3 export type Mode='top'|'sidebar'
export type Layout={mode:Mode,topbarHeight:number,chromeHeight:number,pageDirection:Enum.FillDirection,fadeSize:UDim2,
fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:number?,tabStripHeight:number?,railWidth:number?,
railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,rowCornerRadius:number?,rowSpacing:number?,
railPadding:number?,rowInset:number?,rowPadding:number?,rowContentSpacing:number?,rowIconSize:number?,footerHeight:
number?,avatarSize:number?,cardTransparency:number?,cardStrokeRotation:number?,cardStrokeTransparency:NumberSequence?,
cardCorners:{string}?}ae.top={mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah+ai,tabStripTop=ag,tabStripHeight=ah,
pageDirection=Enum.FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),NumberSequenceKeypoint.new(0.7007,0.631),
NumberSequenceKeypoint.new(1,1)}}::Layout ae.sidebar={mode='sidebar'::Mode,topbarHeight=af,chromeHeight=af,railWidth=219
,railCollapsedWidth=64,railCollapseBelow=589,rowHeight=38,rowCornerRadius=14,rowSpacing=4,railPadding=17,rowInset=15,
rowPadding=10,rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=34,pageDirection=Enum.FillDirection.Vertical
,cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius','BottomRightRadius'},cardStrokeTransparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(0.128,0.95),NumberSequenceKeypoint.new(
0.414,0.985),NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),fadeTransparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.377,0),NumberSequenceKeypoint.new(1,1)},fadeCorners={
'BottomRightRadius'}}::Layout function ae.get(aj:unknown):Layout?if aj=='sidebar'then return ae.sidebar elseif aj=='top'
then return ae.top end return nil end function ae.railWidthFor(aj:Layout,ak:number):number if aj.mode~='sidebar'then
return 0 end local al=aj.railWidth::number if ak<(aj.railCollapseBelow::number)then return aj.railCollapsedWidth::number
end return al end return ae end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)local ae,af,ag=ac(
ab.Parent.variables),ac(ab.Parent.log),{}export type LocaleToken={[any]:string}export type Translator=(source:string,
localeId:string)->string?export type TranslationTables={[string]:{[string]:string}}ag.strings={}::TranslationTables ag.
current='en'ag.translator=nil::Translator?local ah={}local function ai(aj:string):string return string.match(aj,'^(%a+)'
)or aj end function ag.t(aj:unknown):unknown if type(aj)~='string'or aj==''then return aj end return{[ah]=aj}end
function ag.isToken(aj:unknown):boolean return type(aj)=='table'and type((aj::{[any]:unknown})[ah])=='string'end
function ag.sourceOf(aj:LocaleToken):string return aj[ah]end function ag.resolve(aj:unknown):any if type(aj)~='string'
then return aj end if ag.translator then local ak,al=pcall(ag.translator,aj,ag.current)if ak and type(al)=='string'and
al~=''then return al end end local ak=ag.strings[ag.current]if ak and ak[aj]then return ak[aj]end local al=ag.strings[
ai(ag.current)]if al and al[aj]then return al[aj]end return aj end function ag.register(aj:TranslationTables?)if type(aj
)~='table'then return end for ak,al in aj do if type(ak)=='string'and type(al)=='table'then ak=string.lower(ak)local am=
ag.strings[ak]if not am then am={}ag.strings[ak]=am end for an,ao in al do if type(an)=='string'and type(ao)=='string'
then am[an]=ao else af.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`)end end end end
end function ag.setActive(aj:string?):string ag.current=if type(aj)=='string'and aj~=''then string.lower(aj)else'en'
return ag.current end function ag.detect():string local aj=ae.localizationService.RobloxLocaleId if type(aj)=='string'
and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[54]=function()local aa,ab,ac=a(54)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.window:
_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.IsLocked(ah)
:boolean return ah.locked==true end return af end return ae end)()end,[55]=function()local aa,ab,ac=a(55)local ad return
(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():boolean return
ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:
SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)
ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then return true end return ah(
)end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()then return end print(...)end
return af end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)return table.concat{
'\137PNG\r\n\26\n\0\0\0\rIHDR\0\0\0`\0\0\0`\b\6\0\0\0\226\152w8',
'\0\0\0\1sRGB\0\174\206\28\233\0\0\0DeXIfMM\0*\0\0\0\b\0\1\135i\0',
'\4\0\0\0\1\0\0\0\26\0\0\0\0\0\3\160\1\0\3\0\0\0\1\0\1','\0\0\160\2\0\4\0\0\0\1\0\0\0`\160\3\0\4\0\0\0\1\0\0\0`',
"\0\0\0\0\1693_N\0\0'\20IDATx\1\237\157\a\156U\213\157\199_\153\25\166\210\1643\192",
'\160(\2\139]T0\168\196\18cb\201\198\186*k\178\171\187&\217U"D\147\172%\26V\163F\221\141\162',
'\168\184\194\218\215^\16\27\24\16T@P:\f\fE\202\0\3\211\251\188\183\223\223\255\220\251x',
'\195\2127\3\234\238g\238p\223\189\247\220sO\249\253\235\249\159s/\129@\199\214\129@\a\2\29',
'\bt \208\129@\a\2\29\bt \208\129@\a\2\29\bt \240\141"\16\252FkK\172\178\164\219o',
'\191=\165o\223\190\201ee\225p\175^\169\181\185\185\185\181\164UQL]bE}ws\127g\b\240\234\171\175\230',
'\f\0288\240o\186u\235vlJJ\202\240\140\140\140~\192\214=\24\ffF\163\209\164@ X\19\141F\202I\219',
"URR\1789\18\137,\222\190}\251\162'\158xb\217\180i\211J\190\187\16\127\135[\246\250\235\175\15]",
'\177b\197\175w\237\218\245~iI\233\174\234\170j\176\142\219"\209h]$\18\5l\176\143K\247N\203\203',
'\203kv\239.X\153\151\1517\249\149W^\25\246\29\238\234w\170iI\159}\246\217\143\182n\221\250JIIi\161',
'\15kmmm\180\166\166&\194\177\206\223\185\174\171\170\170\170\171\168\168\172\3\236\186\178\210',
'\178\186R\246\178\1782\187\174\172\172\140\136@\218H\219\139\138z\232\177\199\30\235\251\157\234m',
'\v\1419\16*HeD[\168G\183\195_|\241\197\133\217\217\2177t\238\220\249\212N\157:\5\234\234\234',
'\2\209h \18\164\4TM\0N\183\29\224\3u\181u\129\186H]\0\132]z\148#\231Q\253Q\27\152\a',
"\244X8\28\14&%'\5\210\211\211\2163\2{\v\246\174_\189v\245u\163G\143\254\176\21m\250\214\179",
'\28\b\2\180\216\137\143>\250h\204\145G\30y\251!\135\28r&\250= n\15\6\130 \232hW\a\1765',
"\1815\129Z\128\231\158\17\198'\134\17\2By\233A\228#XS]\29(+/\15\148\151\149E\162\129PY(\24",
"\173\b'%\213d\164\167\135z\244\236\153\5a\243?\253\244\211qW_}\245\230\22\27\247-g\192\184\29",
'\188\237\207\127\254s\247\243\207?\255\150~\253\250_\159\150\150\154.\224\209/\209`0D\165Q\128\174',
"\rTW\215\176W;\208\1Z\\/\201\168\173\169\245\136b\199\16\234'\176u\219\214\202\146\226\226",
'\229E\197\197\243KKK\191,+*[[UWU\128Q.GUU\167\166\166\134\251\244\233\211i`\159>\225\202H$\255\224',
'\245\172\249\146g\207\158\157s\2041\199\f^\186t\233\1943\2068\163\180\185\220\a\141\0\159|\242',
'\201\216#\1428\226\193\30=z\28\139Z\23\a\163j\156\192E\0\184\n\208\197\201\181\156\235\218',
'\a\190\6\130\212\212p\15I\0\212P\193\238\130\192\150-[rw\228\239xQvc\202\148)\203\232Pus\157',
'\250\150\238%}\250\233\162\239eg\247\25\223\189{\247s\177U\135\172[\183n,m\153\223\\{\26#\128',
'\175\150Z\163\215\27+;\248\213W_\221x\216a\135\221\145\158\158\158\185\15\248\160\233m\1\\U]e*',
'\5\251i\220.\142G2\2\213\0\15#s^\19\220[X\24\196\168n\193\195yh\254\252\249O\207\1533gwc',
'\149\181&\237\246\211oO\186\232\161\139~H{z\21\21\21\173\199}]\255\227\31\255x+\207\182{<\241',
'\242\203/g\143\0241\226\199\168\215+\178:w>\185SJJReEe`\193\130O\151>\249\228\147\203[j_c\4h+\240',
'\129\235\175\191>s\226\196\137\247\225\207_\167\138\29\248\190\186\169\v\224\181\192\221\181\24U',
'g\\\141\235\157t\152\26\18a\170\225\250\ryy\129\181k\215\206\192E\253\221\243\207?\191\165\165',
'N\180x\255\136m)]\187t\157<p\208\192\17HU\20{\180+??\127}YY\197\130\146\146\162\5\1557o\254\242',
'\197\23_\2206c\198\140\178\22\203\26\18\232\244\234\189\175f\231\228\f<\185W\175>\231eee\141',
'\203\204\204\234-\225\198y\136B\224(\140\19X\182\244\139\251\240\246\138[*\207\231\246\150\242\181x',
'\159\193P\207\179\207>\251\191\250\247\239\255C\233z\f,\134\214y+\242j*+\171\26\2\143\r\144',
'\174\23\231K\29\149WT\132V\174XQ\176z\205\154\t\247\222{\239\244\22+M \195SO=u\214\169\167~\239',
"\181\254\253\251\165'''\a\146\146\28\239\137!\170\170*\139i\199\198\146\210\146\141\180}\r\237",
'\221\140[[@\158\n\236S2\30[VZZZ\127\28\136\195\144\162a\28\143HOK\235\138\225\167O\226\215hD}',
'\196]\14\148\149\150\132>\154=\2513T\229\25\v\22,\168h\169\137\a\132\0pN_\192\127\190W\175^',
'c\233\136\211\245\230V\162\235Q)\213p\182\185\147\158+)\189/\3Lg\197\241\16\160&\128\159\31Z\178',
'dI\238\202\149+\175|\248\225\135?k\169\225m\185\255\220s\207\253\227\232SN\153\210\165K\215PrJJ\20u',
'\17\b\133B\1\134z!\220\217zEJ-\202\19\147\221J\nC\1728\164tO\2220\2474\0041{\6\17M\157',
'\174^\181:\248\241_?\190\244\247\191\255\253K\245\nl\226B\250\161]\219\179\207>\219\227\2363\29',
'\248pA$\24\162\165\252\147\154\169\168\168\144!5\240}uc\250\30\240\1971F\0288\176\188\172<\244\229',
'\151K\215\0\254\133\a\v|u\242\242\203/\127|\249\242\21\143\213bc\4XEe\185\181\0030i.\255',
'\234\234\162\236:j\192\17\1298b&\232`\247H\215\17\170\208=\246(.\177\235ce\133\217\183\138\202\202',
'P\222\198\188e\132U\222V}\173\217\218E\128\27o\1881m\204\2321O\245\234\211k\172\192\0237iS\251+\202',
'+\172s\226"\129/\tP\219E\0\243\138\0\30c+\241\15\173\\\181r\211\138\21+/\6\252\21',
'\173it{\242|4\251\163\219\182m\219\182\154\182\134\164~\0\205\156\2\141C\196\206\141\25@\r',
'\254\220\166A`\196\218_)\2\194`\242\214\164\134$A\187w\238\n\236\220\177\227\137\197\139\23+f',
'\213\170\173=\4\b\254\226\23\191\184\a\195\246#:\2\248NF\r\252\138rS+\2\223\237b1\157;',
'\31_\30\143:\\S[\23Z\189zu1\198\246\170\191\252\229/r/\15\250v\255\253\247\239\222\178y\243',
'\253j\3\131A\3T\158\153\28\4\237R\137\178K\226n\27\4zN\130\147\216\170\128<\156J8\158k\163',
"\151\bbR\207o~\254\142\237kss\255'\145N\180\153\0\v\23.\188v\192\128\1\191RC\156{O(A\156",
'\15W\136\195MI\194O>\240\138\216\232\\\210 \27\192ep\235\214\175\163\248\202\191}\224\129\a',
"\230&\210\232\246\230\157\251\206'/\23\226\142\18\194\b\137\229\177\1\1803\n\168\24d\156",
'\129\n\184[\196\168\0h\237r \164J5h\20a\232\vf7\138n\170\147\0170\131N\231\2\184\206s\166N',
'\157\186=\145\246\181\137\0\232\184\227q\229\254\2213\\2F\214\1\1373\250\213\184J\rS\167t',
'\228\31\231uA3\1964T\2491\186\1935k\214\188|\215]w=\146H\131\15D\222\187\167\220\189\183\184\184',
"\244\189\148\148N\214\22\192\244\218i\192\2\174/\185\238(.\175\159\135k\165I3\177'%%\ap?\3Du",
'\223J\180}\t\19\224\166\155n\2028\249\228\147\31\200\204\204\236&c%\189/\144\197!r%\29\2404\\',
'v\fnWg\212X\17\195\164\129t\17\3?\127\a\220\127\179\235B\162\205n2\127\156\175\210d\30\187Q',
'YY\254\185T\162\\R`\247\218\232\218*5\170\182\26\232^\187e\191\1564{\196\162\20\245U\27\2347D8',
'\164\b\255?a\239\173\177\129\152\21\218\212\2075\215\\s]\239\222\189\191\1358\198\140\174DW\174',
'\166\235\136k\160\196\148\182[#\173\161\\\235O\4+((\bn\222\184\241\207\136\235\250\166\234ic',
'\186C\164\21\15\3\216\22||\\\209N\bd\16>Q\187\0052\128J\162\173\f\1343*Qd\245K\246H\236a',
'\143\230G\2pS!\194\246\143\150-K8\254\148\16\1^\127\253\197!\f\180n\22wK\239K\149\200\171',
'\145\190\244E\212:b\157\1vu\200:\21\161\31\174\a\24\172\16#\207\181\243\230\207\127\178\0218',
'\29\180,p~\25\204P\23\f\133\194\234\135\243,U\157\b\225\170\213\209Nc?\22\195u7\213\127\253',
"\241l(\28\146$\21\174\1523'\225\24UB*\232\232\163GM\234\210\165KO\fQL\245\b|\137\178\25&q9",
'\128\vl\142\176\149\142nW\171\21\138\214hq\219\246m\143\206\1545k\143\235\201\183\243\203\2326',
'\3\27\230\249n\180A`\171\189~\155\237\232T\146\147\fO\5\209?\169#\147j5\221\136\19\b0\176K',
'\230*!<\245x\171\31\1529s\230Q=z\244\186\fu\227\133\147\tI\162\243\229\158\249 \187\198\235\146',
'M\29\160\2q\tL\15\167\132\2\169\157RC\219\182m-`b\230\21U\254mn\2049\15\134!\2120k\171$',
"\149V\139u\140\153|\207(f\187\232\143\179\1('\242)]\155\242\203f\164$\167\244\249\245\181\215f&",
'\218\167V\19\128\208\242\191dd\1641\217Q\27\rk\248N\165U\184g\180\197\26\238\154b\208\1874\26',
'\1664\240\183M\195~\196=\176s\231\206Y\140\1587%\218\208\3\157\159 \218\201\242\226\156\244:P\141',
'\0b\156\152\1\1427\188\1584\24c\185\190yDc\244\\\27\205\200\204\232y\212\1521\135&\218\206V',
'\17\224\1417\222\24\220\187W\239\v\196\241\2\17\174\177\209\163y\n\158\138\241\206=\184\213',
'\192\152\249BM\6\3\157RS\3\165%%\129\130\157;_O\180\145\a:?\131\190C:w\238r\166\0\215\160',
'\139\182\235\212\24\201q\190\205OhA\128#\16v\206\\hyGf\211\156\4x\210\17d4\28e\1545e\200\144',
'!\167&\218\214V\17\224\240\195\15\191\28\n\247\144\219)\238W M\1960\129\245\b`\220\19wNo\192',
'=d\234\1993R!|\229\1625\185+\150$\218\200\3\157\255\228\19O\190\184k\215.\131\0\222\162\152\28',
'\130r&\180\vh\169\20\2\133\164iD\236\6\142v_\4\17\17d\243l\151TX\216\221\1401\147O?\164',
'\173\173\194\212\239S\139\153\21\239a\178\225bQ[\156\172]A4\26m\28c\5\137\225\181\185\163\252',
"\3m\252\146\198O8\20\198\0'\aJ\203\2027\207\1545\167\253\241}\171\172m?7\223|s\183\236A\217",
'\191\146\250\145\253R(\\\160\186\b\173\3\187\214\3W#z\133,D\b\159@\202g}\a\15\135\1',
'\4#\143B\240D\131GM\1556\237\200DZ\214"\1~\250\211\159\30\131\190\28\129\159o\198W\r\209',
'\128K\155\195\219\228\192\213)\196\197\18\218\28\250v\26f\213\130\252\255\234\234\202\181\0277n',
'\172\180\196o\233\231\202+\174\156\0P\195\0017\194h\220\139\251\136\251]x\\#y\169%\141m<`-\180',
'\162\208\185\22\r\196\136\1\145d+\156\196\224\138WTF\187v\237\1545r\228\200+\18\233Z\139\4',
'\160\177g3\217\157\f\181-\224\166\192\149\2269\166mLG\186!\139G\r\3\222\176\167\21:J\0184P',
'\145\138\162\195y\1374\238@\231}\231\157w\198\f\26<\232\6\177\137\2j\26\189+\182c\224*\232',
'\230\159\3\180K\211=\210u\r\227\153\20H*\252sp\176H/8H\146\212G\226c\151\252\2307\191\233\210',
'\218\182\183D\128p\231\204\206f\172(\\\n\197\130U\28p\221\2289X\157\170\2156\203\224N\189_\167',
'\178p\183-#\137\219\234\221\254\6/dx\143:\234\168)\132P2+\153\150d\198\203T\144\212\144\237\138',
'\206r\174\128\155]#\229\178s\230j\195\253J3b\152$\236\147\14\17C\170HR\3A#\168\235!\23^x\225',
'\15Z\219\181f\t@\208m@zf\250p\185\155\240\1785@"\b\154\6(\21\203\137\182\136\160\231\146',
'\185z!\136\207\253\146\0\6\155\150\206\20_\179K4Z\219\2326\228\v\159s\2069\0151\138\31\137',
'\4G\138\139\139\141\251\0056\203!\29\200:z\231\2\29"\217\\A%\209]\vA+\fM\148\212\166O',
'\141hxO\146\14\167\255M\18\0205\165\143\193\236\236\236\127>\254\248\22750kqk\150\0\131\a\15',
'\30\202`\165\27bfzF\203E\196\2378mA\237\210\254@m\212\128\215=9 \133\241\165\173\253A$\20W\145',
'\254w\132h\182\186\22\27\219\214\f\2047L\204\201\201\249;\192\138\178\166\200F\227R?\218\29\151',
'\19\231\231\\\0jd\175s8\158\232m]\136~\18\178\142p\140\132\176\15!9 6\137#bA\b\127\225\152o',
'\27)/\13874\230\142;\238h\149K\218l,\b\2453\18\2\4iXTjD\149\tt\t\0b\224i\28\188\1',
'\18\236\2\176\249gDb\128\233\178p\173\1800v #+\171U\\\209V\160\27{\238\195\15?\188\252\208C',
'\15\189\3&\136\22\22\22E\203\203\203\0\185\2\224\221\1300q\176\212\139\212\b\1864$\247',
'\178\172\172\28\143\173\180\f\206/\164\19\133\244\138\152Q0\3[\216\r\r\214\29cks\0H\3',
"]\167\2390\156<\189\218p\173\25\227\206]:'\17\174\191\134\246\204n\172M\241i\205\18 )%\201\\*",
'\233{M\1778\245c\224\27\200\30\247\27\192J\245(c\229\203d\216,\153\17\128\6\226\246%\135\195=',
'\226+?\0\231\148n\155jo\176\189\253\246\219cO8\225\132\135;uJM)*,\140\148\148\20{3Z\154\134t\170G',
'\128\0196\t1AC<\127\2316b\250\127-,,|\143\137\165\165\204Wl\221\176a\131\194\204\1451c\198\164\14',
'\29:\180\'+\239\134\246\236\217\243\28\142?\0268`\224aI\153I\146\162\136\194-\204\236[\185"(Rp>+',
"1\14'z\188\174A\195\226\18\154#@\144%\24\3\1403@7\130\238\215(\156I<SA\206\242\1544\152\r\128",
'\203\1\1<\220\175\192\199mUM\n\1828)\160\188C\227\234>\16\167\141\2\175\130Y\2313\156\5',
'\186O3B\237\6\231G\4\176f\235\164b4!/7\147\190\133\0<\192\204\220\23_\127\253\245T\230(\222d',
'\212\223\168\163\192J\191\26v\189\135\176\129}\230\247\191\255\253;Y\220\245\247C\14\27r\v\139',
'\208\14A\146"a\128\175M\nK\149E\bZv9\238\184\227.!\239\31\217\155\220\154$\0o\162$3\211',
'\163I\23\139\16\202\221\210\198\240\220\231::\224\212\144\18d\19t\148\174\247\226?\142$\168}\223',
'Mb<q8Yd\b<\223\149\179\131\176\221s\207=\217\163G\143y\14U\145S$\240\247\238\213\154#\185\193\6',
">&-\180\151\180\188\188\188\133;\182m\189\127\2503\207\188\201D}\171'\210\213dT[\1\251\253LP\189",
'\15\248\143\14\31>\252\20\217J\1694-0\203\136\164\a\b\223\\1i\210\164\255\248\211\159\254',
'\212\228\v$\254b\152\24\168>\30\23_|q\218\200\163F\254+\161\135C\16)\180\144\r\193\197\205',
'\198\246\166\251x\138c\189g\r\127~|C,\130$3\16#^\30\164qDmS\158\155;wn\147\r\242\235o\235\241',
'\134\27n\232\250\243\159\255\252\197\129\3\a\156TTT\28\217\179g\143\2449z\189\20\174\175\14',
'\17\14\15\174]\189&\239\171e_\253v\202\163Sn\1569k\214R&gj\18\168\175^\127Y6\153O_\223\26\144=`',
'T\159>}s\0\138`eX6\193\2t\244{\225\244\233\211W7U\190\239\1504\16e\1946\157(,\2213N\198\197R%',
'\2\\\220.]\163s\17\194\\Pg\196HsU\185\163\187Pl\133vE0`=\199\142\29;\180\169\198\1807]Ls\195',
'\r7>\158\147\147sZ1\2243\243\22(*.\n\176P6\136\209e\205\206\198\242\249\243\231=\240\206\187',
'\239\156\nW>\154(\215{\237k\128\21\v\190\242g\207\153\2533\22\15oLJN\14Ik\200\195\146\0033x',
'\240\224\139\155\235\151O\128\6y\160\156\164#L\240\207\3_\245\250\187%\tl\151\160_\241\133\161',
'\174\vm\238h\4\146\26\163 \150\247\133\241\145\199\185\251\a\2527\233\15\127\248\195\131\131',
'\6\r\252)\28\29\217\189{w\0\195\171\245I!\206\131\139\22-\156=o\238\2203o\187\237\246\tM',
'\233\249\246\180\136\165\148\235\243\2426Ld\156Q\135\212[pO..\239\188\157\246\224\131\15\246n\170',
'\236&\t\192\140\145\224dwA7\1\25\155-\178\193\151\31\140\243\1\167\n\233\31.\225v\30t',
'\187\187\150\0048\181\143m:\159e\140\25M5\168\173\233,k\252#s\22\215"\185\209\29;\242\3\133E',
'\133AF\187\1615kVo\251x\246\156_L\1520\225\a\188\190\180\160\173\229\183\230\185+\175\188\242\181',
'\252\157\249s\t\189\155f``\23\201\202\204\234\127\236\177\199\158\222\212\243M\18\0001\170A\147k',
'\166}\31\240\\8\170\24\184T\226F\193"\129\210\133\190\254\236\204#\128\148\149\198\t\18K',
'\0066Q\214\206\15\255\215_\255z\180e:@?\139\23.\158\132\17\156\4\231G\243w\228k\133rh\211\166M',
'\145\5\243\23Lg\161\236\169\247?p\191\150\19046_+\185=\144[-\198}*\253\180y\19\173\154\211\235S',
"\196\211\206i\170\146&\t@'\136ZF\139dLM\141\196q\181\207\221\238(\240%\r\210U~5\222\137\163\1502",
'\152\219GjTj\232\200!C\198\2519\219{d\25\224?\142\0249\226\143x8\226\252 \28\24"m\209\199\31',
"\127|\222\164\155'\141g\225p^{\235H\228\249u\235\214\205\197\213\221\149\156\20\214\b\218B\21",
'\168\161QW]uU\163R\223$\1pC\171Q\27\1875\128r\\m\\o`:\21\163fA\28\185\165\30\222f\176!\148',
'\174\r{\221\183sf\158\224\6\221\231\217(\3\153\v\254\231\217g\143J\164c\141\229\1577o\222O',
'\134\r\27\246 \158M\18~|p\201\146/\182\0\252\191\252\231\127\254\254\140\135\30zhVc\207\236',
'\151\230\181|\191\212v\\\162\230v\162\25171\248\163\239n\189\20L\151s\222y\231\rl\172\216&\199',
'\1d\142\176jy+/\31x*\200\215\237\14a\n\151\179\169\14\152\190Se\138\249H\221\buQ\197;\229',
'\204-_\209\bQ!\1\198\3\153G\159x\226\r<\251\179\198\26\213\154\180w\223}\247\140\225#FL/..I',
'_\180\240\243\252u\185\185\255\197\203\128\143\188\249\230\155\155[x\222\220\133\22\242\180\2496q',
'\167j\194\218\187\240\183\3A\164\18\213\27a\0\154\129g6\130BW\237_ps\4P\228o\157\194\t\146',
'\0008\221(\234\25Xgm)\205\0\247J\213=\197\128do\2379\209\194\203\195BJ\v|\225\154i0\23\237\215',
'\175\223e\239\191?s\218Yg\157;o\255F\181t\205*\234\204\156\156\193w\230\174[\183\145\183!_d\\1\227',
'\165\151^\202k\2339\239\190\154tP7\156 \248\204\153\23\164>\170\151A\232\247\209T\218`\225n\179\4',
'(..\251J\170\131\2\r|\143\165\5\190h\18D\161\192\253\174/\142\173t\1613\17\v\213\165\155',
'"\156\228!\228\212\144\164\1285\153Q\184"m\216\208\17w3\229y\22\139s[|\147\196\213\226~Qa',
'\21\168\249\191c\219EJB#\216\248r\218x\238\144u\188\213\160\b&\230;\177\228\165\135\250\174?\169]',
'mH\253\161\r2\147\208\164\rP\230\173[7\175B\159\21\137\162\226t\r\184\236\168\149\193:\151a',
'\22\192\251\210\1894\210I\211\238\6az\206\157+\228k\249\17\131~\217\217c\198\143\31\175\245\161',
"\tm\151\\rI\29\224o\226\161o\26|\191\157MJ\17\179a=!\192\0001\1742\25!\192\14)\200\230\210'",
'\158_N\243\4`\b\189\137\129\204z\25\20J\210?\175@\15|#\138\\LG\28\3\29\130\248`;\163',
'\171\188^~\142\154s\213\196\135\184\131\198E\tdM\252\224\131\15\206\136\181\232\224\1584\0\160',
'\r\2135\t\190\202\226\141\201\0191\186\189\152\194\4\6\147\0[\21\14\19+\18\f\144\245',
"\183f%\0\189Z]^Q>'5\181S\140\154\142\16\162\4\28n\192\202\253\228\220\133\27\28\216v\238q?",
'\247\226\t\161\241\128\214\220K2D\0\194\19iLdO}\230\153g\6\213o\218\255\205+\194\212W\200\206',
'i\238\220i\0011\167lc0\245\164\147Nj0\31\210,\1\4\193\142\29;f\17G\209\132\188\f\129\175',
'\130dH\141\211\193\208\184Y\149\b\\K\215=\157{\187\191\142F\17U\1/\241ThX\207\202K`\1602d\220',
'\25\227\158\194\22tm\'\236\226p\127ogQ\137?\206;\195\1991\'lo\137"\233\240\167\152S/\243\209(~',
'\210x\5w\255R\27$\236\159\1\15\227\179\138\138\242\r\204\6)\bgT\21!\4\158\175Z\246',
'\217\2/]\247\226\238\139\16\182\198&N2l\234\143\216\1886f\218"}\250\2469\227\130\v.x\226\218',
'k\175M\223\191\r\173\184\222\31\244\166\212DS\233MU\161r[\187\133F\142<\234\183\204?\164\19\136',
'\139\154\r0\28\156\163\130-\173\219^Q\225b\250q%\182H\0\0222\17\211*\156\137\215b\143\25\240',
'\20\204?#\130H,B\152$\136\243m\247\2108\247\185^\18a;R\224K\135\139\207\19!\160\155\146\132\193',
'\131\a\255\237M7MzDQ\205\18466u\234\131\227\31\227\243\197\167\233<\254:>\223\1;gn\224o\179\179',
'\251_\4\240QM\226\139)\221T:\163%\184\31\2\1482\195\214\192\219k\145\0j\225\134\r\27\158',
'\129\170\149Z\205\237\128\246A\151\151\233@\199\228\216,\139\187\214$\142\192\151*r\247\181\174&\182',
'\182\198\158A\0291\199\204G7l|\160F\138\bC\134\28:\158\t\149\167\239\185\231\201\172\22\208',
'\217\159\155u\29\191\251\143\251i\254u"\199\253\235h\244Y\156\149\193,y\185\23\227\171\249\134',
'\168^@\164/z\191\213\192W\179 \204\14\30fII\253\173U\4`\24\189\136\216\208\199\248\178zu\4',
'\227\238\f\168\169\25\137\130mH\5\21\250\18\226l\129[3\227K\133\210b\v\157\180\164\195\22B',
'\213\4\b\162Y\252\\\140J\195\163H\194\197W]u\238\203tl`\253\230\214\191\162.c\136\250\169\223',
'\236\21\238pg\2308\158`\14x\16\203w"Z\198\226\212\173\217@\248\202E\1\192/\175\177\1505K\0',
'\175\131\18\223:\222jy\132\225]$\232K\1\1923\232\213\218\148\152\20\248\4\208Q\160\155{\170s',
'\169\31_\245\24\240\254z\26g\0274?\235\136P\169\197\1886|\231c}g\157{\238\185\239#\218\227\26k',
'\184\159F\a\197\1>\23\248\201\254\241\160\170\31\214\254\164\179\252\228\241A\131\6\141c\128',
'\25\177\197^\142\251\213_[]-\223E\246\142{K\253F\197\31\155%\128\168\231o\207O\1568\19[0\183sVV',
"\200\0038\136~\215\128\140K\a\184\169'\b\227s\188o\31L\31z\132\144M0\2067\149\228\150\5j\181",
'\133\220\182\146\226\0185\212\208\148:\130\171\1428\233\196\147\222\248\242\203/o\201\201\201i\224C{',
'\224\251Ml\236\216\28q\26\203\175\180V\17M\223Bb\226\127\6\227\152KP/\17\169R\1\173\145\190',
'\129O\255\132\a\209\228\224\158={k`\224\196\t@cp\161\140\195\2S\23/\174\201]\147\251\239\196',
'\183k\152-SC=\224\221\187\178\170\204\215\249\245\b\129\r\0Lo\1514\176#\5\182\234X\210\128K*',
'\t\144\222\212B\'u\132\1432\145_\207E"i\25\233\25\140\19&\227\141\189\245\206;\239\141Q\197',
'\ai\147:s6\142\1904\183\177\220\229\24>{0\147\245F?\161\237,w)\181\197^50\146\236\26*H3b|N\205',
'\150d\6\139\138\n7\191\255\254\251k\27+s\31\1397v\183\1454\190\231\160\165\30W3>\128\153q\177',
'\188<\2\221m\178\250P\135\203}\18\228"\165\246\170\18A*wd\29\141\206\137\160\234\157\3\189',
'C\160E\188\250\2\137B\224Z\206\206\144>\160o\203\137)\233L\b\226TR\2394$\226AVm7\186\222F z\r',
'\137\29|&\138%\180\241Dq\30\190\206\248\15|\142\231vf\246zh\198+\198\2490\146\152I\210lL\134\157',
'\204\204\200dB&9\180t\233\146\23\177\163\1516Vm\179\193\184\198\30\152?{\246\157\227\206=\247\236d',
'\222\137\170\168)\199\247q\219>\2\232\26"\240k\1k\29\181\203pC.}\196F\1299X\1414\206\165',
"\154\180\138\192\174\177'vt\198\\\220\1647k\156\v\28\142\224e\164\2\194\245\f\220.\205]\159",
'\251\210\214\175\183N=\237\180\211$\218~3Dt\154\226\136\16\127N\158\246l\1619s\230\156\199\148\231D',
'\234\254\158\150]\18\170\143\148\218\2_\190\250%\240\145\226\152\164\163f\197|Jg9L\148\185\138',
'\6QP\1911\r\184\197\191\209\220q\246\135\179\255a`\206\160\199y\223\203\176\21hb\249\250D\240',
'\200`58\169P\138\207\245j\160I\2\199`\216-\2373i@\18\194HB\18R\160\149f\146\6\133sSS\245U\196T',
"\187\166\28n\133d/*\240.\230\177\184\234e\1909\241\193e\151]\182\190\185v'z\143\201\149\190\132\15",
'~\192\250\158\241]\186v\25\v\3\4YQ\23\169`}\145\255I\6{\135\192\1889\169Y\143\251a*I2\v',
'\171B\5{\n\2141a?\234\181\215^+l\172\2546\17\128\130\146\23/Z\252\2\175-]\196\186\27Fw!\243',
'yE\4#\6\f)\154H\21y\160\139P\\\tt\29D\16G\148\144\184\0310}\245\228\212\145\214\213\184',
'\165~"\128v\17G\132@\b\2\169ii\166\174(Cz\214V @\140=\140U\22\211\158\207\180\195u+\136e',
'\237bo\237\138\236\224\228\201\147\187\159p\244\209\3\250\f\24p\18s\215\227\232\223\152\172',
'\140\172\254aV\1871\144\226\157\130\170\168\128\215\ni\1270\233\212\142l\154\198=\222`\211c\200',
'\244\140\244\208\162E_\220}\245\213W\222"$\26\219\218J\128\0\2201\240\148SF\207\225\235"',
'\131e\136\188\177\1\30\128\192\151\n\17\206N\205\24\232\232{3\24F\21T\16G\129\234\31u\238',
'_\27\224\136\185\17\6\240%\242I\128\224\231\241&8\144\138N\154\2320I\161#\177\143.\233]d\198\141',
'{Q\t\219\25moA2\181o\199\213-&\173\146\193j$9\20JJNMNcl\211\21\134\237\15\179\2300q\1971\220',
'\31\219\163\215\231\r\212\154\218\234\136\150\231+\140\238\6XR5\17\185\202Fxq\189T\143\244\190',
'\27\2518\143\144\231C\213\213U{\248\228\218)L 5j\128E\1446\19@\15\191\245\214\204\159\f\206\25',
'\244<+\207\146\232\160\26\165\198\201\r\227\174\152~\223\6\220va\162`B \240\149d\6\214@\150z2',
'\130\136\227=\2\249D1\149\132\180\200X\139@zV\210#bh\229\157>\188\145\140\225V>+\133\2\164\202',
'\\\29\251\218\209\220\153y^P\135\17\187\190\226k#t\29]\191\220\156\246\190>\210O\250\171\209',
'\189\250\235\250-\198s\131Mf]C\203W\174|\240\202+\174\184\177\185:\219E\0\161\183|\249\242wy\1',
'\251\236\189\133{#Z\242\2378A\141\2jC\219U\15\131ca\217\141\14\174Z\129-\132\194p\184\142\2]',
'\1710|\208\141\24\220s\156\175{N])\221\238yRc\146\226\1712\17\5"h9\136\b\224?\235\219\27G',
'\17g\175\252\241\138q\176\a\162\198(\214\a\128\149\131\224s\181\203\3\192\150\230\250\231\6',
'\155:w\\\239\174k\197 \161\162\146\146\252\23\158{n\204\211O?\221\172]J\216\vrp\198~\163tp!.',
"\217\217%\248\239\26\130\171\17\254&\181\228\251\169uQ'\1\204cB\3(\195\165\212\148N\17fN\228",
'\29\1,\249\\\25"\132\128\22\1\252\1638M\28Nn\143P\14\224}\234k\31a\200E\217\202\231',
"\202\216'q\214>*w\30\151#\6\2L{<\194\232\158\b\160k\129K?\24\216\218Qi1\192m\172B\159M\229*",
'\221\245_jq\237\186\213\247\180\4\190\218\209^\2\4\194\201\201\00350\131\234\130\19\20U\172',
'\253\232\196\26\167d4\170]\211~\4A\nI\127\\\224\146:\175Qs\3\202\t\133<\14\215\138\23',
'\162\31t\204\129H2\183jc\6[\224\27\184\158\228\b|m.]\207x;i\246\130\185\221m\248\227\3\239',
'\219.\a\178\b &q\128\219\236\22\231\202\19#\128\136#\149\235\17\0\143Hs\221\225\188\188\188',
'y\211\30\1596\181aM\rS\218E\0\6%G\247\235\211\231\135L[\170eV\186\26\163M\151j\168:\16O\16',
'q\1796\19i\1\196m\129\168M\191\26#\136."\138\0tD\0h\1590\228\17\152\142\211}\1289\154:re',
'\171,\149i\220\175s\187\230\215#\144\149\207\143\210\213:\255\218uA]q\160\171\19&%\230Xx\233q\4P>',
'G\16\245\181N\132\15\227\154\23\179Rc\2\31\175m\249\27\164T\221f\2\176\238=k\212\168Q\0153',
'\165x\b\159\23&\186\128\248\153\216\1627\205%s\156\226\b\160\190;p\156\151\228\1760 \129\193',
"\193/\201`\147\138\178\4\215a\193'\3\167\163\143\31/\fyD\240\203\245\212\149 \181j\\^\191N",
'\29\221\185k\131\131\29a\5@\'\178\190\224R\167\254\4\172\199<"\128\2173?\221@\23\217\148',
'\206/\4\0173Ap\173\192\14,Y\186\228\223X\20\182P]i\205\230\183\1685y\227\243\4W\174^\253\200',
'\176\161C\255\137\181\144\145\237\219\182\ad\3\170\bFU\219\136\144\21\1^\195\173\147>\0',
'\134\143\171\18H\f,I\132\f\164\15\156_I\172a\202fv@\\\230\164\196Q\204\129\236\30t\185\205',
'\221\141=\168;\252\153\196\249y)]\216yyhb\140\168:\215M\181\215\2068\26!\188\163\15\184\187\183',
'\143\185\156\148\243\181\148\148T}zs\234\132\t7\2543y\1961\173\218\218$\1|\176\239gC\14=\244:',
'\6%Q\6=\246\214 >/~\178\2knh\174\218\29\231\232\5=OW\3\134\245\31\0\236hy\248A\207\19',
'\167\224D\169\234\184;7\206%\133\b5e\tN\25l\253\176\199o\164I\142\156\157\151\218"\246\164',
'\251\2\223\236\n\231&>~\173\241\15\251\231\170\215?\23\130\\x0:5\227\221$S\157t>\220 \15IG',
'\166kC\171V\173x\231\158{\238\158@\t\173\6_\181%L\128\183\222z\235x>\222q\159D\142u\247\22\tT',
'\24V\175o\234\b\215\132\228\5\200#\202\202J\a\140\136"\156\188\196&\140\157\255\238\186I',
'\135\0\26h\r\\Ah\bp\208\185\207\137F\4\175K>7\139H\2457q8\192\240\197d\31h\148\130V\142',
'\1976SAz\204\202W6H$ \149Ci\156\248\28\175$\17\195\181\1\194\200\6\232\207\207c\224;/I\179`',
'\171V\173\252\132\1\2155|\143\186Uz_\229\251[B\4\208\135.x\241\236Q\220\206\174\172D\142\232=+',
'\173JF\18\130D\6Q\233\225\224\206]\249e\187w\21\188\206\154\205\185\221\187w\201\236\217\179\199',
'E\253\251\15\24\173\152I\21\171+T\177\15\174u>v\r\24$x\248\187\206\210iS+\150\202\163\17g|',
'\197\204\202\27\191\1854%z\b\235\204/\204\206=\233\243\206\141\199\227\n\137\129m\229\nlW\129',
'\142\22^\225\168s%\235\133EY\15F\226\2\255\175\132;.\231U\165\157\20\157\240\182\175\181-?\26',
'\204\205\205\157r\216a\135]\135\218\137\240\t\248\0\0194\16\0\15\b-CP,\176y\243\166\215V',
'\172X\250\199i\211f,\138+.\149\161\248/\135\0301\244\246\204\172\172\140\194\189\133\24l\183\220Q`',
'\249\192\169c\192\234\253\179\v\174]\243\156\1\221?\205\213 uc@\139\163\217\164\18\\~\187\226',
'\1352\236_\\W]\1651\144Ui|\233\14h\151Bq*\213\3\223\25\\\6x\246_\167\172Y\179\250\2137\223',
'|\227:\230*\180D\178M[\\\171\154\127\158/\129\143?\246\216\227\158\210K\206\188\v\133\238\223+',
'\149\195\219\227u\129\175\191\222\178j\197\138\229w\242*\206\243\148\226\247\165^\129\191\251\221',
'\239\198\158p\252\241\247\245\207\206>\17\233\208\4\134\253\2231\202$\237.\bD\132x}\171t/\128',
'\20\199\205*\2225\219\231R\149\225s\167\27\180y\247U&\4\178b\188g,/\233\150C\245y\207*\221\210',
'\248\177v\128|\252=?\220 \174\215\244\233\234\181k\30\152|\215]\n\178\233;\14m\222\\K[x\28',
'\189?\140\137\231\217\f\184z\235\205\19\189\252F\0N\239^\149\229\174]\247\216\2193\223\190\1875',
'\\\192\178\189\204_\254\242\151\147\176!\191b\217{W$(\138\235f&Wb\174\198\24!L\231r\17\227T\r',
'\221\184k\172\238\192\174\223d\159x\148\129\177\137\233{\149\231D\203Jv\207\236\179/v\237\1n\168+',
'\193\171\3\195d\4\240\129\':\27LMK\r"\249\219\191\252b\233o\30}\252\209\25\174\188\246',
'\253\182H\128\211O?=\245\191\255\251\153\183\251\246\2373n\195\134\r\188\252V`\28\192\249\188\229',
'\203\151\221\204WH>I\180\t\188Jz\f\239M\221\145\157=\224<\fv\152\143gD\181\152\169\30p\20*',
'\14\212\196\141\233`]\27\152\2\216\1\174z\245\140\15\178\29\185\246;\165\231\205\208Bb\201',
'\152\198\29\202c\249T\150e\140{\222\242;\26(\143\192W6y9\nC\231\229\173\127\253\243\207?\159\b',
'C6:\27\167\199\19\221\252\1826\249\220\178e+n\0256\236\200\201\1556o\138\22\240\182a^\222\198\221',
'\171W\175\185\239\182\219\254\237!\30rK\219\154|\186\217\27\193\223\222z\235\217#\134\14\157\212',
'\171W\239\211!DH\170\tw\214\240V\195\4\160\1f\197pe\255<\245\225\193l`:Ry\185t\159\167\189\188',
'\146(\187\237\229\17\131\vT%\186\163N\235\19YjP\145V\166C\249vD$\192\235\172\203\233\243\228\199',
'\30{\228Er\239\239\4\171\1766o\205\18\224\195\143?\28=\234\184\147g\149\150\22g\242y\249\192',
'\250\188\r/}\244\193\a\183\189\240\194\v\r\222\244hs\v0\224\183\222z\235\153L5\254S\183n',
'\221\207a\1909\r\207J3N|\207\205\r\232\132\167\227aj\137\161\166S!\201.Te,\213\27\210l1\166\142',
'\241y\149\207\178\186.\27a\149G\127\168<\27P\2418j6\152\218\169SP\147.;\243\243Wm\217\178\249QB.',
'\211\249\210W\1633Z<\210\174\205\181\166\145"\2542y\242!\23\141\31\255!\223\195<z\206\199sV~',
'\181d\201\157wN\158,#\219\214\205\175K\1685\186\2419\252\227\142<r\248\229\189{\247\188 3#\235\240',
'\20&\228\249\198\179yZ,\31\0053\244\178\140\170\191\233T\165\238ckSW.\201\169\150\24\17\148\232=',
'\17047\130uDbN!(\224\21\190.)-\174\194S\251d\195\134\188\25\207>;\2275\236\212A\1\222\239\130',
'\15\138\127\29;\242q\213\159\163_\239\228\165\183G\152\211\156\130\231S\16\187\217\246\147\253',
'\235\139Cs_\161,x\234\194\162\172\211\178\179\179\207\203\202\236|\26S{C\152\165\226[\24\238\255',
'\162azP\241\23<Nvq\185t<%\251\\lX\139\187u\143MG\179/\220\1441\213 2E\255\143\fs\6\1383\241?i',
'\148\149\20\151\174\220\181+\255}8\253\r\222\172\148\27}@U\1415\164\145\159\253\1\137ea\209Q',
'\207\247\222{/\196\255V\154\240\a\169c\133\212?i\172\174F\t\16\255X\247\238C:_u\213yG\245\239',
'\223\255T\150\b\141\226\191\138:<)\156\156\221)59\v\142\181\239>\171\16\173\1600\245\3\155',
'\2035\214F\136\156$s\228\141\0\0263h\1492\234\165\144\184\213\230\189{\247\172***\249d\199\142\221',
'\243\166O\127Bj5\145oFX\29\237\253i\f\148\246\150y\144\159\207N\187\244\2101\253X\0148\16#98=3s@',
'R(\1697\255\165d7\130?]\25\143\165\128:\159Y`\225^\164\174\28;\194\164|0\191\170\170"\191\180',
'\180|kEE\217f\\\233\r\188M)\198j\151\15\127\144;\218Q|\a\2\29\bt \208\129@\a\2\29',
'\bt \240\255\24\129\255\5\143\2006p=\\u\b\0\0\0\0IEND\174B`\130'}end)()end,[57]=function()local aa,ab,ac=a(57)local ad
return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah
,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab
.elements)end function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end
end function ag.MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return
af end return ae end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local ae={}ae.__index=ae
export type RequestFn=(...any)->any function ae.getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or
af.http_request or(af.http and af.http.request)or(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end
return ae end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local ae=ac(ab.Parent.variables)
local af,ag=ae.textService,{}ag.__index=ag local ah=20 local function ai(aj,ak,al)local am=Instance.new
'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge local an,ao=pcall(af.GetTextBoundsAsync,af,am)
return if an then ao else Vector2.new(ak*0.6,ak)end local aj={}local function ak(al,am)local an=tostring(al.Family)..'|'
..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(am)local ao=aj[an]if ao then return ao end local ap,aq={},
0 for ar=0,9 do local as=math.ceil(ai(al,am,tostring(ar)).X)ap[ar]=as if as>aq then aq=as end end ao={advance=ap,
maxWidth=aq}aj[an]=ao return ao end function ag.new(al,am,an)an=an or{}local ao=setmetatable({window=al,container=am,
textSize=an.textSize or 16,transparency=an.transparency or 1,duration=an.duration or 0.55,slots={},length=0},ag)ao.roll=
TweenInfo.new(ao.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)ao.zIndex=math.max(am.ZIndex+1,6)ao.height=
math.ceil(ao.textSize)local ap=ak(al.theme.Font,ao.textSize)ao.advance=ap.advance ao.maxWidth=ap.maxWidth al:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=an.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(
0,0),Parent=am})return ao end function ag._reel(al,am)local an=al.slots[am]if an.reel then return an.reel end local ao=
al.window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,
BorderSizePixel=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.container})local ap=al.window:Create('Frame',{Size=
UDim2.fromOffset(al.maxWidth,al.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=al.zIndex,Parent=ao})for aq=0,ah-1 do al.window:Create('TextLabel',{
Text=tostring(aq%10),Position=UDim2.fromOffset(0,aq*al.height),Size=UDim2.fromOffset(al.maxWidth,al.height),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment
=Enum.TextYAlignment.Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=ap},{TextColor3='ContentColor',
FontFace='Font'})end local aq={cell=ao,strip=ap,digit=0,target=0,stripTween=nil,sizeTween=nil}an.reel=aq return aq end
function ag._static(al,am)local an=al.slots[am]if an.static then return an.static end local ao=al.window:Create(
'TextLabel',{Name='Static',Size=UDim2.fromOffset(0,al.height),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=
1,BorderSizePixel=0,TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.
Center,TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=al.container},{TextColor3='ContentColor',FontFace='Font'
})an.static=ao return ao end local function al(am)if am.stripTween then am.stripTween:Cancel()am.stripTween=nil end if
am.sizeTween then am.sizeTween:Cancel()am.sizeTween=nil end end function ag._reelSnap(am,an,ao)al(an)an.cell.Size=UDim2.
fromOffset(am.advance[ao],am.height)an.strip.Position=UDim2.new(0.5,0,0,-ao*am.height)an.digit=ao an.target=ao end
function ag._reelRoll(am,an,ao,ap)if an.stripTween or an.sizeTween then am:_reelSnap(an,an.target)end local aq=an.digit
if aq==ao then return end local ar,as if ap then ar=aq as=aq+(ao-aq)%10 else ar=aq+10 as=ar-(aq-ao)%10 end an.strip.
Position=UDim2.new(0.5,0,0,-ar*am.height)an.target=ao local at,au=ae.tweenService:Create(an.strip,am.roll,{Position=
UDim2.new(0.5,0,0,-as*am.height)}),ae.tweenService:Create(an.cell,am.roll,{Size=UDim2.fromOffset(am.advance[ao],am.
height)})an.stripTween=at an.sizeTween=au at.Completed:Connect(function(av)if av==Enum.PlaybackState.Completed and an.
stripTween==at then am:_reelSnap(an,ao)end end)at:Play()au:Play()an.digit=ao end function ag._putDigit(am,an,ao,ap,aq)
local ar=am:_reel(an)local as=not ar.cell.Visible ar.cell.Visible=true ar.cell.LayoutOrder=-an if am.slots[an].static
then am.slots[an].static.Visible=false end if aq and not as then am:_reelRoll(ar,ao,ap)else am:_reelSnap(ar,ao)end end
function ag._putStatic(am,an,ao)local ap=am:_static(an)if not ap.Visible then ap.TextTransparency=am.transparency end ap
.Text=ao ap.Visible=true ap.LayoutOrder=-an if am.slots[an].reel then am.slots[an].reel.cell.Visible=false end end
function ag._hide(am,an)local ao=am.slots[an]if not ao then return end if ao.reel then ao.reel.cell.Visible=false end if
ao.static then ao.static.Visible=false end end function ag._render(am,an,ao,ap)an=tostring(an)if an==am._lastText then
return end am._lastText=an local aq={}for ar,as in utf8.codes(an)do table.insert(aq,utf8.char(as))end local ar=#aq for
as=0,math.max(ar,am.length)-1 do am.slots[as]=am.slots[as]or{}if as<ar then local at=aq[ar-as]if at:match'%d'then am:
_putDigit(as,tonumber(at),ap,ao)else am:_putStatic(as,at)end else am:_hide(as)end end am.length=ar end function ag.to(am
,an,ao)am:_render(an,true,ao)end function ag.snap(am,an)am:_render(an,false,true)end function ag.reveal(am,an,ao,ap)am.
transparency=an for aq,ar in am.slots do if ar.static and ar.static.Visible then am.window:_reveal(ar.static,{
TextTransparency=an},ao,ap)end if ar.reel then for as,at in ar.reel.strip:GetChildren()do if at:IsA'TextLabel'then am.
window:_reveal(at,{TextTransparency=an},ao,ap)end end end end end return ag end)()end,[60]=function()local aa,ab,ac=a(60
)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:
OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return
ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae={}function ae.join(af:string,ag:
string?):string if not ag or ag==''then return af end return af..'/'..ag end local function af(ag:string):string local
ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):string local ah=
tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.
sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function
ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:
unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end
return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()end,[62]=function()
local aa,ab,ac=a(62)local ad return(function(...)local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.
persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.
delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings
return ae end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.
Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.
Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:string?,_canBeNil:boolean?,_serialize:((
PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:(PersistedControl,unknown)->()}type
ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,customFolder:string?},name:string,
_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function ak.getPath(al:ConfigWindow,am:
unknown?):(string?,string?)return ai.getConfigPath(al,am)end function ak.save(al:ConfigWindow,am:unknown?):boolean local
an,ao=ak.getPath(al,am)if not an or not ao then ag.warn("Rayfield: configuration name '"..tostring(am)..
"' has no usable characters")return false end if typeof(af.writefile)~='function'then return false end local ap:{[string
]:unknown}={}for aq,ar in al.controls do local as,at=pcall(function()local as=ar._serialize if as then return as(ar)end
return ar.value end)if as then ap[aq]=at else ag.warn("Rayfield: Failed to serialize flag '"..tostring(aq).."' - "..
tostring(at))end end local aq=al._loadedConfig if aq and al._loadedConfigPath==ao then for ar,as in aq do if al.controls
[ar]==nil then ap[ar]=as end end end local ar,as=pcall(ae.httpService.JSONEncode,ae.httpService,ap)if not ar then ag.
warn('Rayfield: Failed to encode configuration - '..tostring(as))return false end local at,au=pcall(function()aj.write(
an,ao,as)end)if not at then ag.warn('Rayfield: Failed to save configuration - '..tostring(au))return false end if al.
_loadedConfigPath==nil or al._loadedConfigPath==ao then al._loadedConfig=ap al._loadedConfigPath=ao end return true end
local function al(am:string):({[string]:unknown}?,string?)if not af.isfile(am)then return nil,nil end local an,ao=pcall(
af.readfile,am)if not an or type(ao)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil
end local ap,aq=pcall(ae.httpService.JSONDecode,ae.httpService,ao)if not ap or type(aq)~='table'then return nil,ao end
return aq::{[string]:unknown},ao end local function am(an:string):string local ao=ah.stripExtension(an,'.rfld')local ap,
aq=ao..' (Incorrect Format).rfld',2 while aq<=100 and af.isfile(ap)do ap=ao..' (Incorrect Format '..aq..').rfld'aq+=1
end return ap end function ak.load(an:ConfigWindow,ao:unknown?):boolean local ap,aq=ak.getPath(an,ao)if not ap or not aq
then ag.warn("Rayfield: configuration name '"..tostring(ao).."' has no usable characters")return false end if typeof(af.
isfile)~='function'then return false end local ar,as=al(aq)if not ar and af.isfile(aq)then local at,au=al(aj.
tempPathFor(aq))if at and au then ar=at pcall(aj.write,ap,aq,au)end end if not ar then if as then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local at=am(aq)pcall(function()af.
ensureDir(ap)af.writefile(at,as)af.delfile(aq)end)end return false end local at,au=ar::{[string]:unknown},an._loading an
._loading=true local av,aw=pcall(function()for av,aw in an.controls do ak.applyTo(aw,at[av])end end)an._loading=au if
not av then ag.warn('Rayfield: Failed to apply configuration - '..tostring(aw))end an._loadedConfig=at an.
_loadedConfigPath=aq return true end function ak.applyTo(an:PersistedControl,ao:unknown)if ao==nil and not an._canBeNil
then return end local ap,aq=pcall(function()local ap=an._deserialize if ap then ap(an,ao)else an:Set(ao)end end)if not
ap then ag.warn("Rayfield: Failed to restore flag '"..tostring(an.flag).."' - "..tostring(aq))end end function ak.list(
an:ConfigWindow):{string}local ao,ap:{string}=ak.getPath(an),{}if not ao then return ap end local aq,ar=pcall(af.
listfiles,ao)if not aq or type(ar)~='table'then return ap end for as,at in ar do local au=ah.basename(at)if au:sub(-5)==
'.rfld'then local av=ah.stripExtension(au,'.rfld')if av and av~=''and not av:find' %(Incorrect Format[^%)]*%)$'then
table.insert(ap,av)end end end table.sort(ap)return ap end function ak.delete(an:ConfigWindow,ao:unknown):boolean if
type(ao)~='string'or ao==''then return false end local ap,aq=ak.getPath(an,ao)if not aq then return false end if typeof(
af.isfile)~='function'or not af.isfile(aq)then return false end pcall(af.delfile,aj.tempPathFor(aq))return(pcall(af.
delfile,aq))end return ak end)()end,[64]=function()local aa,ab,ac=a(64)local ad return(function(...)local ae,af,ag=ac(ab
.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:
string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?):(string?,string?)local aj=ae.fileSystemManager:getPath
'Configurations'if ah.configuration.customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end
if ai~=nil then local ak=af.sanitizeFile(ai)if ak==''then return nil,nil end return aj,af.join(aj,ak..'.rfld')end local
ak=af.sanitizeFile(ah.configuration.fileName or ah.name)if ak==''then ak=af.sanitizeFile(ah.name)end if ak==''then ak=
'Configuration'end return aj,af.join(aj,ak..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.
fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[65]=function()local aa,
ab,ac=a(65)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.
Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),{}type SettingsWindow={settings:{
toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean,showProfile:
boolean,theme:string?}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:
unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?,theme:unknown?}function aj.getSettingsPath():(
string,string)return ag.getSettingsPath()end function aj.saveSettings(ak:SettingsWindow):boolean local al,am=aj.
getSettingsPath()local an:{[string]:unknown}={toggleKeybind={tostring(ak.settings.toggleKeybind.EnumType),ak.settings.
toggleKeybind.Value}::{unknown},mouseOverride=ak.settings.mouseOverride,keepOnScreen=ak.settings.keepOnScreen,
welcomeToast=ak.settings.welcomeToast,haptics=ak.settings.haptics,showProfile=ak.settings.showProfile,theme=ak.settings.
theme}local ao,ap=pcall(ae.httpService.JSONEncode,ae.httpService,an)if not ao then return false end local aq=pcall(ah.
write,al,am,ap)if not aq then return false end return true end local function ak(al:string):(DecodedSettings?,string?)
local am=false pcall(function()am=af.isfile(al)end)if not am then return nil,nil end local an,ao=pcall(af.readfile,al)if
not an or type(ao)~='string'then return nil,nil end local ap,aq=pcall(ae.httpService.JSONDecode,ae.httpService,ao)if not
ap or type(aq)~='table'then return nil,ao end return aq::DecodedSettings,ao end function aj.loadSettings(al:
SettingsWindow):boolean local am,an=aj.getSettingsPath()local ao=ak(an)if not ao then local ap,aq=ak(ah.tempPathFor(an))
if ap and aq then ao=ap pcall(ah.write,am,an,aq)end end if not ao then return false end if ao.toggleKeybind then pcall(
function()local ap=tostring(ao.toggleKeybind[1]):gsub('^Enum%.','')local aq=(Enum::any)[ap]if aq then local ar=ai.
itemFromValue(aq,ao.toggleKeybind[2])if ar then al.settings.toggleKeybind=ar end end end)end if type(ao.mouseOverride)==
'boolean'then al.settings.mouseOverride=ao.mouseOverride end if type(ao.keepOnScreen)=='boolean'then al.settings.
keepOnScreen=ao.keepOnScreen end if type(ao.welcomeToast)=='boolean'then al.settings.welcomeToast=ao.welcomeToast end if
type(ao.haptics)=='boolean'then al.settings.haptics=ao.haptics end if type(ao.theme)=='string'and string.match(ao.theme,
'^%a+$')then al.settings.theme=string.lower(ao.theme)end if type(ao.showProfile)=='boolean'then al.settings.showProfile=
ao.showProfile end return true end return aj end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)
local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.tempPathFor(ah:string):string return ah..ag end function
af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(ai)ae.ensureDir(ah)ae.writefile(ak,aj)if ae.readfile(ak)
~=aj then error'parked copy did not write cleanly'end ae.writefile(ai,aj)pcall(ae.delfile,ak)end return af end)()end,[67
]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae,af=ac(ab.Parent.variables),{}function af.location(
ag:any?):Vector2 if ag and ag.UserInputType==Enum.UserInputType.Touch and typeof(ag.Position)=='Vector3'then local ah=ag
.Position return Vector2.new(ah.X,ah.Y)+ae.guiService:GetGuiInset()end return ae.userInputService:GetMouseLocation()end
return af end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ac(ab.Parent.services)
export type RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:Workspace,runService:RunService,userInputService:
UserInputService,guiService:GuiService,localPlayer:Player?,tweenService:TweenService,httpService:HttpService,textService
:TextService,replicatedStorage:ReplicatedStorage,localizationService:LocalizationService,guiContainer:Instance}local af=
{}::RuntimeState af.secureMode=(function()if typeof(getgenv)~='function'then return false end local ag,ah=pcall(function
()return getgenv().RAYFIELD_SECURE end)return ag and ah==true end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.
workspace=ae.getService'Workspace'::Workspace af.runService=ae.getService'RunService'::RunService af.userInputService=ae
.getService'UserInputService'::UserInputService af.guiService=ae.getService'GuiService'::GuiService af.localPlayer=(ae.
getService'Players'::Players).LocalPlayer af.tweenService=ae.getService'TweenService'::TweenService af.httpService=ae.
getService'HttpService'::HttpService af.textService=ae.getService'TextService'::TextService af.replicatedStorage=ae.
getService'ReplicatedStorage'::ReplicatedStorage af.localizationService=ae.getService'LocalizationService'::
LocalizationService af.guiContainer=(function():Instance if af.runService:IsStudio()then local ag=af.localPlayer if ag
then return ag.PlayerGui end return af.coreGui end if typeof(gethui)=='function'then local ag,ah=pcall(gethui)if ag and
ah then return ah end end return af.coreGui end)()return af end)()end,[69]=function()local aa,ab,ac=a(69)local ad return
(function(...)local ae={}function ae.getService(af)local ag=game:GetService(af)return if cloneref then cloneref(ag)else
ag end return ae end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ac(ab.Parent.
variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{},{},0,1024 local function ak(al:GetTextBoundsParams):
unknown local am,an=pcall(function()return af:GetTextBoundsAsync(al)end)return if am then an else nil end local function
al(am:unknown,an:'X'|'Y'):number?if typeof(am)=='Vector2'then return if an=='X'then am.X else am.Y end if type(am)==
'table'and type((am::any)[an])=='number'then return(am::any)[an]end return nil end function ag.textWidth(am:Font,an:
number,ao:any):number ao=tostring(ao)local ap=tostring(am.Family)..'|'..tostring(am.Weight)..'|'..tostring(am.Style)..
'|'..tostring(an)..'|'..ao local aq=ah[ap]if aq then return aq end local ar=Instance.new'GetTextBoundsParams'ar.Text=ao
ar.Font=am ar.Size=an ar.Width=math.huge local as=al(ak(ar),'X')if not as then local at=utf8.len(ao)or#ao return math.
ceil(an*0.55*at)end local at=math.ceil(as)if ai>=aj then ah={}ai=0 end ah[ap]=at ai+=1 return at end function ag.
textHeight(am:Font,an:number,ao:any,ap:number):number local aq=Instance.new'GetTextBoundsParams'aq.Text=tostring(ao)aq.
Font=am aq.Size=an aq.Width=ap local ar=al(ak(aq),'Y')return if ar then math.ceil(ar)else an end return ag end)()end,[71
]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.
constants),ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.Parent.assetResolver),ac(ab.Parent.fontManager)type
RuntimeState=ae.RuntimeState type FileSystemManager=ah.FileSystemManager type AssetResolver=ai.AssetResolver type
FontManager=aj.FontManager export type VariablesState=RuntimeState&{fallbackFont:Font,fileSystemManager:
FileSystemManager,assetResolver:AssetResolver,fontManager:FontManager,setFallbackFont:(font:Enum.Font|Font)->(),
brandFont:(weight:Enum.FontWeight?)->Font}local ak=table.clone(ae)::VariablesState ag.setSecureModeSource(function()
return ak.secureMode end)ak.fallbackFont=Font.fromEnum(Enum.Font.BuilderSans)ak.fileSystemManager=ah.new()ak.
assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl)::AssetResolver ak.fontManager=aj.new(ak.
fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,
skipCache=false,fallbackFont=ak.fallbackFont})::FontManager function ak.setFallbackFont(al:Enum.Font|Font)if typeof(al)
=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)=='Font'then ak.fallbackFont=al ak.fontManager.defaultOptions.
fallbackFont=al end end function ak.brandFont(al:Enum.FontWeight?):Font if ak.secureMode then return Font.new(ak.
fallbackFont.Family,al)end return Font.new(af.fontAsset,al)end return ak end)()end,[72]=function()local aa,ab,ac=a(72)
local ad return(function(...)local ae,af=ac(ab.Parent.layouts),{}export type Profile={defaultSize:Vector2,minSize:
Vector2,maxOccupancyX:number,maxOccupancyY:number?,marginFloorX:number,marginFloorY:number,topbarClearance:number?,
maxAspectRatio:number,minAspectRatio:number?,widthCompensation:number?,chromeHeight:number}local ag,ah,ai,aj,ak=200,{top
={defaultSize=Vector2.new(475,500),minSize=Vector2.new(300,285),maxOccupancyX=0.86,topbarClearance=36,marginFloorX=24,
marginFloorY=28,maxAspectRatio=2.3,widthCompensation=130,chromeHeight=ae.top.chromeHeight}::Profile,sidebar={defaultSize
=Vector2.new(685,450),minSize=Vector2.new(560,350),maxOccupancyX=0.92,maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,
maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=ae.sidebar.chromeHeight}::Profile},600,557,0.55 local function al(am:
Profile,an:Vector2,ao:number?):Profile local ap=table.clone(am)ap.defaultSize=an ap.maxOccupancyY=ao or am.maxOccupancyY
return ap end local am={top=al(ah.top,Vector2.new(450,560)),sidebar=al(ah.sidebar,Vector2.new(645,520),0.79)}function af
.profile(an:ae.Mode?,ao:boolean?):Profile local ap=if ao then am else ah if an=='sidebar'then return ap.sidebar end
return ap.top end function af.scale(an:Vector2?,ao:boolean?):number if not ao or not an then return 1 end if an.Y<ag or
an.Y>=ai then return 1 end return math.clamp(an.Y/aj,ak,1)end function af.pageHeight(an:number?,ao:ae.Mode?):number
local ap=af.profile(ao)local aq=if an and an>0 then an else ap.minSize.Y return math.max(aq-ap.chromeHeight,0)end
local function an(ao:Profile,ap:number):number local aq=ap-ao.marginFloorY if ao.topbarClearance then aq=math.min(aq,ap-
ao.topbarClearance*2)end if ao.maxOccupancyY then aq=math.min(aq,ap*ao.maxOccupancyY)end return aq end local function ao
(ap:number,aq:number,ar:number):number return math.clamp((aq-ap)/(aq-ar),0,1)end local function ap(aq:Profile,ar:number,
as:number):UDim2 local at=math.floor(math.min(math.clamp(as,aq.minSize.Y,aq.defaultSize.Y),as))local au=ao(at,aq.
defaultSize.Y,aq.minSize.Y)local av=math.max(aq.defaultSize.X+(aq.widthCompensation::number)*au,aq.minSize.X)return
UDim2.fromOffset(math.floor(math.min(av,ar,at*aq.maxAspectRatio)),at)end local function aq(ar:Profile,as:number,at:
number):UDim2 local au,av=math.min(math.clamp(as,ar.minSize.X,ar.defaultSize.X),as),math.min(math.clamp(at,ar.minSize.Y,
ar.defaultSize.Y),at)av=math.floor(math.min(av,au/(ar.minAspectRatio::number)))au=math.floor(math.min(au,av*ar.
maxAspectRatio))return UDim2.fromOffset(au,av)end function af.fit(ar:Vector2?,as:ae.Mode?,at:number?):UDim2 local au=at
~=nil and at<1 local av=af.profile(as,au)if not ar or ar.X<ag or ar.Y<ag then return UDim2.fromOffset(av.defaultSize.X,
av.defaultSize.Y)end if au then ar/=at::number end local aw,ax=math.min(ar.X*av.maxOccupancyX,ar.X-av.marginFloorX),an(
av,ar.Y)if av.minAspectRatio then return aq(av,aw,ax)end return ap(av,aw,ax)end return af end)()end},{{1,2,{'Rayfield'},
{{39,1,{'utility'},{{61,2,{'path'}},{52,2,{'layouts'}},{56,2,{'logoImage'}},{42,2,{'colors'}},{53,2,{'locale'}},{44,2,{
'enums'}},{49,2,{'functions'}},{64,2,{'persistencePaths'}},{46,2,{'filesystemManager'}},{54,2,{'lockable'}},{59,2,{
'odometer'}},{57,2,{'moveable'}},{71,2,{'variables'}},{40,2,{'HapticEngine'}},{58,2,{'network'}},{45,2,{'filesystem'}},{
72,2,{'windowSizing'}},{69,2,{'services'}},{55,2,{'log'}},{51,2,{'imageCache'}},{70,2,{'textMetrics'}},{68,2,{'runtime'}
},{41,2,{'assetResolver'}},{63,2,{'persistenceConfig'}},{47,2,{'flagNames'}},{48,2,{'fontManager'}},{50,2,{'image'}},{67
,2,{'pointer'}},{43,2,{'constants'}},{65,2,{'persistenceSettings'}},{62,2,{'persistence'}},{60,2,{'ordering'}},{66,2,{
'persistenceWrite'}}}},{31,1,{'themes'},{{35,2,{'ember'}},{37,2,{'rose'}},{36,2,{'frost'}},{32,2,{'amethyst'}},{33,2,{
'cobalt'}},{34,2,{'default'}}}},{38,2,{'types'}},{2,1,{'components'},{{24,2,{'tabSection'}},{30,2,{'window'}},{5,2,{
'chrome'}},{20,2,{'sidebar'}},{15,2,{'notification'}},{28,2,{'toast'}},{9,2,{'divider'}},{4,2,{'button'}},{27,2,{'text'}
},{16,2,{'popup'}},{26,2,{'tag'}},{8,2,{'descriptor'}},{14,2,{'keybind'}},{10,2,{'drag'}},{19,2,{'section'}},{12,2,{
'group'}},{22,2,{'stat'}},{23,2,{'tab'}},{18,2,{'search'}},{21,2,{'slider'}},{25,2,{'tabSelector'}},{29,2,{'toggle'}},{
17,2,{'progress'}},{7,2,{'console'}},{11,2,{'dropdown'}},{13,2,{'input'}},{3,2,{'action'}},{6,2,{'colorpicker'}}}}}}},
'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,xpcall,tostring,
tonumber,_VERSION local av,aw,ax,ay,az,aA,aB=aj.insert,aj.remove,aj.freeze or function(av)return av end,al.wrap,ae.sub,
ae.match,ae.gmatch if at and az(at,1,4)=='Lune'then local aC,aD=ap(ao,'@lune/task')if aC and aD then af=aD end end local
aC=af and af.defer local aD,aE,b,c,d,e,f,g,h=aC or function(aD,...)ay(aD)(...)end,{[1]='Folder',[2]='ModuleScript',[3]=
'Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local i,j={GetFullName={{},function(i)local j,k=i.Name
,i.Parent while k do j=k.Name..'.'..j k=k.Parent end return j end},GetChildren={{},function(i)local j={}for k in ai,h[i]
do av(j,k)end return j end},GetDescendants={{},function(i)local j={}for k in ai,h[i]do av(j,k)for l,m in ai,k:
GetDescendants()do av(j,m)end end return j end},FindFirstChild={{'string','boolean?'},function(i,j,k)local l=h[i]for m
in ai,l do if m.Name==j then return m end end if k then for m in ai,l do return m:FindFirstChild(j,true)end end end},
FindFirstAncestor={{'string'},function(i,j)local k=i.Parent while k do if k.Name==j then return k end k=k.Parent end end
},WaitForChild={{'string','number?'},function(i,j)return i:FindFirstChild(j)end}},{}for k,l in ai,i do local m,n,o=l[1],
l[2],{}for p,q in ai,m do local r,s=aA(q,'^([^%?]+)(%??)')o[p]={r,s}end j[k]=function(p,...)if not h[p]then ah(
"Expected ':' not '.' calling member function "..k,2)end local q={...}for r,s in ai,o do local t=q[r]local u,v,w=an(t),s
[1],s[2]if t==nil and not w then ah('Argument '..t..' missing or nil',3)end if v~='any'and u~=v and not(u=='nil'and w)
then ah('Argument '..r..' expects type "'..v..'", got "'..u..'"',2)end end return n(p,...)end end local function k(l,m,n
)local o,p=(ag({},{__mode='k'}))local function q(r)ah(r..' is not a valid (virtual) member of '..l..' "'..m..'"',3)end
local function r(s)ah('Unable to assign (virtual) property '..s..'. Property is read only',3)end local s,t={},{}t.
__metatable=false t.__index=function(u,v)if v=='ClassName'then return l elseif v=='Name'then return m elseif v=='Parent'
then return n elseif l=='StringValue'and v=='Value'then return p else local w=j[v]if w then return w end end for w in ai
,o do if w.Name==v then return w end end q(v)end t.__newindex=function(u,v,w)if v=='ClassName'then r(v)elseif v=='Name'
then m=w elseif v=='Parent'then if w==s then return end if n~=nil then h[n][s]=nil end n=w if w~=nil then h[w][s]=true
end elseif l=='StringValue'and v=='Value'then p=w else q(v)end end t.__tostring=function()return m end ag(s,t)h[s]=o if
n~=nil then h[n][s]=true end return s end local function l(m,n)local o,p,q,r=m[1],m[2],m[3],m[4]local s=aE[p]local t=q
and aw(q,1)or s local u=k(s,t,n)b[o]=u if q then for v,w in ai,q do u[v]=w end end if r then for v,w in ai,r do l(w,u)
end end return u end local m=k('Folder','['..ad..']')for n,o in ai,ab do l(o,m)end for n,o in ai,aa do local p=b[n]c[p]=
o d[p]=n local q=p.ClassName if q=='LocalScript'or q=='Script'then av(f,p)end end local function n(o)local p,q=o.
ClassName,e[o]if q and p=='ModuleScript'then return ak(q)end local r=c[o]local function s(t)local u,v,w=nil,ap(function(
)return debug.traceback(nil,2)end)if v then u=w end return{Message=t,Traceback=u}end local function t(u)local v,w=ar(u.
Message),o:GetFullName()local x,y=aA(v,'[^:]+:(%d+): (.+)')local z if not x or not au then z=w..':*: '..(y or v)else x=
as(x)local A=d[o]local B=au[A]local C=x-B+1 if C<0 then C='?'end z=w..':'..C..': '..y end local A=u.Traceback if A and A
~=''then z=z..'\n'..A end return z end if p=='LocalScript'or p=='Script'then local u,v=aq(r,s)if not u then ah(t(v),0)
end else local u={aq(r,s)}local v=aw(u,1)if not v then local w=aw(u,1)ah(t(w),0)end e[o]=u return ak(u)end end function
a(o)local p=b[o]local function q(r,...)local s={ap(r,...)}local t=aw(s,1)if not t then ah(s[1],3)end return ak(s)end
local r=ax(ag({},{__index=g,__newindex=function(r,s,t)g[s]=t end,__len=function()return#g end,__iter=function()return ai
,g end}))local s,t=ax{version=ac,envname=ad,shared=r,script=am,require=ao},p local function u(v,...)local w,x,y=an(v),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if w=='table'and h[v]then if v.
ClassName~='ModuleScript'then ah(x,2)elseif v==p then ah(y,2)end return n(v)elseif w=='string'and az(v,1,1)~='@'then if#
v==0 then ah('Attempted to call require with empty string',2)end local z=p if az(v,1,1)=='/'then z=m elseif az(v,1,2)==
'./'then v=az(v,3)end local A for B in aB(v,'([^/]*)/?')do local C=B if B=='..'then C='Parent'end if C~=''then local D=z
:FindFirstChild(C)if not D then local E=z.Parent if E then D=E:FindFirstChild(C)end end if D then z=D elseif B~=A and B
~='init'and B~='init.server'and B~='init.client'then ah('Virtual script path "'..v..'" not found',2)end end A=B end if z
.ClassName~='ModuleScript'then ah(x,2)elseif z==p then ah(y,2)end return n(z)end return q(ao,v,...)end return s,t,u end
for o,p in ai,f do aD(n,p)end return n(m:GetChildren()[1])