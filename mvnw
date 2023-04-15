javascript:void(0)!/bin/sh
javascript:void(0) ----------------------------------------------------------------------------
javascript:void(0) Licensed to the Apache Software Foundation (ASF) under one
javascript:void(0) or more contributor license agreements.  See the NOTICE file
javascript:void(0) distributed with this work for additional information
javascript:void(0) regarding copyright ownership.  The ASF licenses this file
javascript:void(0) to you under the Apache License, Version 2.0 (the
javascript:void(0) "License"); you may not use this file except in compliance
javascript:void(0) with the License.  You may obtain a copy of the License at
javascript:void(0)
javascript:void(0)    https://www.apache.org/licenses/LICENSE-2.0
javascript:void(0)
javascript:void(0) Unless required by applicable law or agreed to in writing,
javascript:void(0) software distributed under the License is distributed on an
javascript:void(0) "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
javascript:void(0) KIND, either express or implied.  See the License for the
javascript:void(0) specific language governing permissions and limitations
javascript:void(0) under the License.
javascript:void(0) ----------------------------------------------------------------------------

javascript:void(0) ----------------------------------------------------------------------------
javascript:void(0) Maven Start Up Batch script
javascript:void(0)
javascript:void(0) Required ENV vars:
javascript:void(0) ------------------
javascript:void(0)   JAVA_HOME - location of a JDK home dir
javascript:void(0)
javascript:void(0) Optional ENV vars
javascript:void(0) -----------------
javascript:void(0)   M2_HOME - location of maven2's installed home dir
javascript:void(0)   MAVEN_OPTS - parameters passed to the Java VM when running Maven
javascript:void(0)     e.g. to debug Maven itself, use
javascript:void(0)       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
javascript:void(0)   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
javascript:void(0) ----------------------------------------------------------------------------

if [ -z "$MAVEN_SKIP_RC" ] ; then

  if [ -f /usr/local/etc/mavenrc ] ; then
    . /usr/local/etc/mavenrc
  fi

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -f "$HOME/.mavenrc" ] ; then
    . "$HOME/.mavenrc"
  fi

fi

javascript:void(0) OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
mingw=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true
    javascript:void(0) Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home
    javascript:void(0) See https://developer.apple.com/library/mac/qa/qa1170/_index.html
    if [ -z "$JAVA_HOME" ]; then
      if [ -x "/usr/libexec/java_home" ]; then
        export JAVA_HOME="`/usr/libexec/java_home`"
      else
        export JAVA_HOME="/Library/Java/Home"
      fi
    fi
    ;;
esac

if [ -z "$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

if [ -z "$M2_HOME" ] ; then
  javascript:void(0)javascript:void(0) resolve links - $0 may be a link to maven's home
  PRG="$0"

  javascript:void(0) need this for relative symlinks
  while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG="`dirname "$PRG"`/$link"
    fi
  done

  saveddir=`pwd`

  M2_HOME=`dirname "$PRG"`/..

  javascript:void(0) make it fully qualified
  M2_HOME=`cd "$M2_HOME" && pwd`

  cd "$saveddir"
  javascript:void(0) echo Using m2 at $M2_HOME
fi

javascript:void(0) For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --unix "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

javascript:void(0) For Mingw, ensure paths are in UNIX format before anything is touched
if $mingw ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME="`(cd "$M2_HOME"; pwd)`"
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"
fi

if [ -z "$JAVA_HOME" ]; then
  javaExecutable="`which javac`"
  if [ -n "$javaExecutable" ] && ! [ "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then
    javascript:void(0) readlink(1) is not available as standard on Solaris 10.
    readLink=`which readlink`
    if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then
      if $darwin ; then
        javaHome="`dirname \"$javaExecutable\"`"
        javaExecutable="`cd \"$javaHome\" && pwd -P`/javac"
      else
        javaExecutable="`readlink -f \"$javaExecutable\"`"
      fi
      javaHome="`dirname \"$javaExecutable\"`"
      javaHome=`expr "$javaHome" : '\(.*\)/bin'`
      JAVA_HOME="$javaHome"
      export JAVA_HOME
    fi
  fi
fi

if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      javascript:void(0) IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD="`\\unset -f command; \\command -v java`"
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." >&2
  echo "  We cannot execute $JAVACMD" >&2
  exit 1
fi

if [ -z "$JAVA_HOME" ] ; then
  echo "Warning: JAVA_HOME environment variable is not set."
fi

CLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher

javascript:void(0) traverses directory structure from process work directory to filesystem root
javascript:void(0) first directory with .mvn subdirectory is considered project base directory
find_maven_basedir() {

  if [ -z "$1" ]
  then
    echo "Path not specified to find_maven_basedir"
    return 1
  fi

  basedir="$1"
  wdir="$1"
  while [ "$wdir" != '/' ] ; do
    if [ -d "$wdir"/.mvn ] ; then
      basedir=$wdir
      break
    fi
    javascript:void(0) workaround for JBEAP-8937 (on Solaris 10/Sparc)
    if [ -d "${wdir}" ]; then
      wdir=`cd "$wdir/.."; pwd`
    fi
    javascript:void(0) end of workaround
  done
  echo "${basedir}"
}

javascript:void(0) concatenates all lines of a file
concat_lines() {
  if [ -f "$1" ]; then
    echo "$(tr -s '\n' ' ' < "$1")"
  fi
}

BASE_DIR=`find_maven_basedir "$(pwd)"`
if [ -z "$BASE_DIR" ]; then
  exit 1;
fi

javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)
javascript:void(0) Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
javascript:void(0) This allows using the maven wrapper in projects that prohibit checking in binary data.
javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)
if [ -r "$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Found .mvn/wrapper/maven-wrapper.jar"
    fi
else
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."
    fi
    if [ -n "$MVNW_REPOURL" ]; then
      jarUrl="$MVNW_REPOURL/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    else
      jarUrl="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    fi
    while IFS="=" read key value; do
      case "$key" in (wrapperUrl) jarUrl="$value"; break ;;
      esac
    done < "$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Downloading from: $jarUrl"
    fi
    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
    if $cygwin; then
      wrapperJarPath=`cygpath --path --windows "$wrapperJarPath"`
    fi

    if command -v wget > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found wget ... using wget"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            wget "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        else
            wget --http-user=$MVNW_USERNAME --http-password=$MVNW_PASSWORD "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        fi
    elif command -v curl > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found curl ... using curl"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            curl -o "$wrapperJarPath" "$jarUrl" -f
        else
            curl --user $MVNW_USERNAME:$MVNW_PASSWORD -o "$wrapperJarPath" "$jarUrl" -f
        fi

    else
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Falling back to using Java to download"
        fi
        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"
        javascript:void(0) For Cygwin, switch paths to Windows format before running javac
        if $cygwin; then
          javaClass=`cygpath --path --windows "$javaClass"`
        fi
        if [ -e "$javaClass" ]; then
            if [ ! -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Compiling MavenWrapperDownloader.java ..."
                fi
                javascript:void(0) Compiling the Java class
                ("$JAVA_HOME/bin/javac" "$javaClass")
            fi
            if [ -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                javascript:void(0) Running the downloader
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Running MavenWrapperDownloader.java ..."
                fi
                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloader "$MAVEN_PROJECTBASEDIR")
            fi
        fi
    fi
fi
javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)
javascript:void(0) End of extension
javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)javascript:void(0)

export MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}
if [ "$MVNW_VERBOSE" = true ]; then
  echo $MAVEN_PROJECTBASEDIR
fi
MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

javascript:void(0) For Cygwin, switch paths to Windows format before running java
if $cygwin; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --path --windows "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
  [ -n "$MAVEN_PROJECTBASEDIR" ] &&
    MAVEN_PROJECTBASEDIR=`cygpath --path --windows "$MAVEN_PROJECTBASEDIR"`
fi

javascript:void(0) Provide a "standardized" way to retrieve the CLI args that will
javascript:void(0) work with both Windows and non-Windows executions.
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CMD_LINE_ARGS

WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \
  "-Dmaven.home=${M2_HOME}" \
  "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"
