# Openshift Ruby

Installer and action hooks for Openshift Do-it-Yourself (DIY) for installing Ruby 2.0.0-p0 via Rbenv and running simple Sinatra application through Thin.

## URL

http://ruby-codecase.rhcloud.com/

## References

- [Openshift](https://openshift.redhat.com/)
- [Ruby](http://www.ruby-lang.org/en/)
- [Rbenv](https://github.com/sstephenson/rbenv)
- [Sinatra](http://www.sinatrarb.com/)
- [Thin](http://code.macournoyer.com/thin/)

## Step by step

### Installing Openshift client

    % gem install rhc

        ===========================================================================

        If this is your first time installing the RHC tools, please run 'rhc setup'

        ===========================================================================
        Successfully installed rhc-1.7.8
        Done installing documentation for rhc (0 sec).
        1 gem installed

    % rhc setup

        OpenShift Client Tools (RHC) Setup Wizard

        This wizard will help you upload your SSH keys, set your application namespace, and check that other programs like Git are properly installed.

        Using [email] to login to openshift.redhat.com
        Password: ************

        OpenShift can create and store a token on disk which allows to you to access the server without using your password. The key is stored in your home directory and should be kept secret.
        You can delete the key at any time by running 'rhc logout'.

        Generate a token now? (yes|no) yes

        Generating an authorization token for this client ... lasts about 1 day
        Saving configuration to /home/subosito/.openshift/express.conf ... done

        Your public SSH key must be uploaded to the OpenShift server to access code.  Upload now? (yes|no) yes
        Since you do not have any keys associated with your OpenShift account, your new key will be uploaded as the 'default' key.
        Uploading key 'default' ... done

        Checking for git ... found git version 1.8.2.1
        Checking common problems .. done
        Checking your namespace ... codecase
        Checking for applications ... none

        Run 'rhc app create' to create your first application.

        Do-It-Yourself                            rhc app create <app name> diy-0.1
        JBoss Application Server 7.1              rhc app create <app name> jbossas-7
        JBoss Enterprise Application Platform 6.0 rhc app create <app name> jbosseap-6.0
        Jenkins Server 1.4                        rhc app create <app name> jenkins-1.4
        Node.js 0.6                               rhc app create <app name> nodejs-0.6
        PHP 5.3                                   rhc app create <app name> php-5.3
        Perl 5.10                                 rhc app create <app name> perl-5.10
        Python 2.6                                rhc app create <app name> python-2.6
        Python 2.7 Community Cartridge            rhc app create <app name> python-2.7
        Python 3.3 Community Cartridge            rhc app create <app name> python-3.3
        Ruby 1.8                                  rhc app create <app name> ruby-1.8
        Ruby 1.9                                  rhc app create <app name> ruby-1.9
        Tomcat 6 (JBoss EWS 1.0)                  rhc app create <app name> jbossews-1.0
        Tomcat 7 (JBoss EWS 2.0)                  rhc app create <app name> jbossews-2.0
        Zend Server 5.6                           rhc app create <app name> zend-5.6

        You are using 0 of 3 total gears
        The following gear sizes are available to you: small

        Your client tools are now configured.

    % rhc app create ruby diy-0.1 --from-code git://github.com/codecase/openshift-ruby.git

        Application Options
        -------------------
        Namespace:   codecase
        Cartridges:  diy-0.1
        Source Code: git://github.com/codecase/openshift-ruby.git
        Gear Size:   default
        Scaling:     no

        Creating application 'ruby' ... done

        Waiting for your DNS name to be available ... done

        Downloading the application Git repository ...
        Cloning into 'ruby'...
        Warning: Permanently added the RSA host key for IP address '75.101.228.201' to the list of known hosts.

        Your application code is now in 'ruby'

        ruby @ http://ruby-codecase.rhcloud.com/ (uuid: 517731fa500446288b00004a)
        -------------------------------------------------------------------------
        Created:         8:14 AM
        Gears:           1 (defaults to small)
        Git URL:         ssh://517731fa500446288b00004a@ruby-codecase.rhcloud.com/~/git/ruby.git/
        Initial Git URL: git://github.com/codecase/openshift-ruby.git
        SSH:             517731fa500446288b00004a@ruby-codecase.rhcloud.com

        diy-0.1 (Do-It-Yourself)
        ------------------------
            Gears: 1 small

        RESULT:
        Application ruby was created.
        Disclaimer: This is an experimental cartridge that provides a way to try unsupported languages, frameworks, and middleware on Openshift.


### Installing ruby

    % ssh 517731fa500446288b00004a@ruby-codecase.rhcloud.com

        *********************************************************************

        You are accessing a service that is for use only by authorized users.
        If you do not have authorization, discontinue use at once.
        Any use of the services is subject to the applicable terms of the
        agreement which can be found at:
        https://www.openshift.com/legal

        *********************************************************************

        Welcome to OpenShift shell

        This shell will assist you in managing OpenShift applications.

        !!! IMPORTANT !!! IMPORTANT !!! IMPORTANT !!!
        Shell access is quite powerful and it is possible for you to
        accidentally damage your application.  Proceed with care!
        If worse comes to worst, destroy your application with 'rhc app delete'
        and recreate it
        !!! IMPORTANT !!! IMPORTANT !!! IMPORTANT !!!

        Type "help" for more info.

_Because of installing ruby takes minutes to complete, I usually run it inside tmux session which can be detached, to prevent "Write failed: broken pipe" error during ssh session._

    > tmux

    ## inside tmux session

    [517731fa500446288b00004a]$ cd $OPENSHIFT_REPO_DIR

    [repo]$ ls
        bin  config.ru  Gemfile  Gemfile.lock  README.markdown  vendor

    [repo]$ ./bin/ruby-installer.sh

        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                        Dload  Upload   Total   Spent    Left  Speed
        102  1330  102  1330    0     0   7191      0 --:--:-- --:--:-- --:--:-- 63333
        Initialized empty Git repository in /var/lib/openshift/517731fa500446288b00004a/app-root/data/.rbenv/.git/
        remote: Counting objects: 1618, done.
        remote: Compressing objects: 100% (644/644), done.
        remote: Total 1618 (delta 1044), reused 1459 (delta 942)
        Receiving objects: 100% (1618/1618), 233.35 KiB, done.
        ................................................
        ..... some output omitted ......................
        ................................................

        Downloading ruby-2.0.0-p0.tar.gz...
        -> http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
        Installing ruby-2.0.0-p0...
        Installed ruby-2.0.0-p0 to /var/lib/openshift/517731fa500446288b00004a/app-root/data/.rbenv/versions/2.0.0-p0

        Fetching: bundler-1.3.5.gem (100%)
        Successfully installed bundler-1.3.5
        Parsing documentation for bundler-1.3.5
        Installing ri documentation for bundler-1.3.5
        Done installing documentation for bundler (34 sec).
        1 gem installed

### Deployment

After making changes and committing to the local repository, you can then pushing the changes to the openshift repository.

    % git push origin master

