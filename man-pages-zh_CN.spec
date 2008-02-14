Name:		man-pages-zh_CN
Version:	1.5
Release:	1
Summary:	Chinese translation of man pages from the CMPP project
Summary(zh_CN):	来自CMPP 计划的中文手册页

Group:		Documentation
Copyright:	FDL
Vendor:		CMPP project
URL:		http://cmpp.linuxforum.net
Source:		http://cmpp.linuxforum.net/download/%{name}-%{version}.tar.gz
Packager:	bbbush <bbbush@163.com>
Prefix:		%{_prefix}
BuildRoot:	%{_tmppath}/%{name}-%{version}-root
BuildArch:	noarch

#==========================
%description
Chinese translation of man pages from the CMPP project.
%description -l zh_CN
来自CMPP 计划的中文手册页。
请访问 http://cmpp.linuxforum.net 来获取更多信息。
#==========================
%package gb
Summary:	Chinese translation of man pages from the CMPP project, gb
Group:		Documentation
%description gb
Chinese translation of man pages from the CMPP project.
Files are coded in zh_CN.GB18030 and you can use "cman" command to view them.
##==========================

%prep
rm -rf $RPM_BUILD_ROOT
%setup -q

%build
rm -rf $RPM_BUILD_ROOT
make u8
make gb

%install
rm -rf $RPM_BUILD_ROOT
make DESTDIR=$RPM_BUILD_ROOT%{_usr}/share install-doc
make DESTDIR=$RPM_BUILD_ROOT%{_usr}/share install-u8
make DESTDIR=$RPM_BUILD_ROOT%{_usr}/share CONFDIR=$RPM_BUILD_ROOT%{_sysconfdir} install-gb

%clean
rm -rf $RPM_BUILD_ROOT

%files
%{_mandir}/zh_CN.UTF-8
%{_usr}/share/doc/%{name}
%files gb
%{_mandir}/zh_CN
%{_mandir}/zh_CN.GB*
%{_sysconfdir}/cman.conf
%{_sysconfdir}/profile.d/cman.*
%{_usr}/share/doc/%{name}

%changelog
* Mon May 24 2004 bbbush <bbbush@163.com>
- FedoraCore2 use zh_CN as an alias of zh_CN.GB2312, but default is zh_CN.UTF-8

* Sun Oct 26 2003 bbbush <bbbush@163.com>
- mainly for UTF-8

* Tue Jun 19 2001 Yangbotao <yangbt@legend.com>
- first chinese manpages.

* Wed Jul 12 2000 Prospector <bugzilla@redhat.com>
- automatic rebuild

* Tue Jun 20 2000 Jeff Johnson <jbj@redhat.com>
- rebuild to compress man pages.

* Sun Jun 11 2000 Trond Eivind Glomsrød <teg@redhat.com>
- first build

