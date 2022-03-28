Name:           harbour-covid19stats
Version:        1.0.0
Release:        1
Summary:        COVID19 Stat app for Sailfish Os
License:        GPLv3
URL:            https://github.com/edp17/harbour-covid19stats
BuildArch:      armv7hl
Source0:        %{name}-%{version}.tar.gz
Source1:        harbour-covid19stats
Source2:        harbour-covid19stats.desktop
Source3:        harbour-covid19stats.qml
Source4:        CoverPage.qml
Source5:        About.qml
Source6:        CountriesList.qml
Source7:        OneCountry.qml

%description
Covid19 Stat app for Sailfish Os.

%prep
%setup
%patch0 -p1

%install
mkdir -p %{buildroot}/usr/share/harbour-covid19stats/qml/resources/flags
mkdir -p %{buildroot}/usr/share/icons/hicolor/86x86/apps
mkdir -p %{buildroot}/usr/share/icons/hicolor/108x108/apps
mkdir -p %{buildroot}/usr/share/icons/hicolor/128x128/apps
mkdir -p %{buildroot}/usr/share/icons/hicolor/172x172/apps

install -D -m775 %{SOURCE1} %{buildroot}/usr/bin/harbour-covid19stats
install -D -m644 %{SOURCE2} %{buildroot}/usr/share/applications/harbour-covid19stats.desktop
install -D -m644 %{SOURCE3} %{buildroot}/usr/share/harbour-covid19stats/qml/harbour-covid19stats.qml
install -D -m644 %{SOURCE4} %{buildroot}/usr/share/harbour-covid19stats/qml/cover/CoverPage.qml
install -D -m644 %{SOURCE5} %{buildroot}/usr/share/harbour-covid19stats/qml/pages/About.qml
install -D -m644 %{SOURCE6} %{buildroot}/usr/share/harbour-covid19stats/qml/pages/CountriesList.qml
install -D -m644 %{SOURCE7} %{buildroot}/usr/share/harbour-covid19stats/qml/pages/OneCountry.qmls

# Icons
install -D -m644 icons/harbour-covid19stats86x86.png %{buildroot}/usr/share/icons/hicolor/86x86/apps/harbour-covid19stats.png
install -D -m644 icons/harbour-covid19stats108x108.png %{buildroot}/usr/share/icons/hicolor/108x108/apps/harbour-covid19stats.png
install -D -m644 icons/harbour-covid19stats128x128.png %{buildroot}/usr/share/icons/hicolor/128x128/apps/harbour-covid19stats.png
install -D -m644 icons/harbour-covid19stats172x172.png %{buildroot}/usr/share/icons/hicolor/172x172/apps/harbour-covid19stats.png

# Flags
cp -r flags/* %{buildroot}/usr/share/harbour-covid19stats/qml/resources/flags/


%clean
rm -rf $RPM_BUILD_ROOT

%post

%files
%defattr(-,root,root,-)
%{_bindir}/harbour-covid19stats
%{_datadir}/applications/harbour-covid19stats.desktop
%{_datadir}/harbour-covid19stats/qml/harbour-covid19stats.qml
%{_datadir}/harbour-covid19stats/qml/cover/CoverPage.qml
%{_datadir}/harbour-covid19stats/qml/pages/About.qml
%{_datadir}/harbour-covid19stats/qml/pages/CountriesList.qml
%{_datadir}/harbour-covid19stats/qml/pages/OneCountry.qmls
%{_datadir}/icons/hicolor/86x86/apps/harbour-covid19stats.png
%{_datadir}/icons/hicolor/108x108/apps/harbour-covid19stats.png
%{_datadir}/icons/hicolor/128x128/apps/harbour-covid19stats.png
%{_datadir}/icons/hicolor/172x172/apps/harbour-covid19stats.png
%{_datadir}/harbour-covid19stats/qml/resources/flags/*