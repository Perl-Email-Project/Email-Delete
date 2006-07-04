use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "Delete Messages from Folders",
               NAME          => 'Email::Delete',
               PREREQ_PM     => {
                                 'Email::Folder' => '0.84',
                                 'Email::FolderType' => '0.7',
                                 'Email::LocalDelivery' => '0.09',
                                 'Email::Simple' => '1.92',
                                 'File::Find::Rule' => '0.28',
                                 'Test::More' => '0.47',
                                },
               VERSION_FROM  => 'lib/Email/Delete.pm',
              );
