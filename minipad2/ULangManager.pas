unit ULangManager;

interface

uses UxlExtClasses, UxlList, UxlDialog;

type
   TLangManager = class (TxlLanguage, IOptionObserver)
   private
   protected
      procedure FillItems (var lang: widestring; itemlist: TxlStrList); override;
   public
   	procedure OptionChanged ();
   end;

function LangMan(): TLangManager;
procedure RefreshItemText (DlgParent: TxlDialogSuper; arritems: array of word; captionid: word = 0);

implementation

uses Windows, UOptionManager, UGlobalObj, UxlStrUtils, UxlFunctions, UTypeDef, Resource;

var FLangMan: TLangManager;

function LangMan (): TLangManager;
begin
	if not assigned (FLangMan) then
   begin
      FLangMan := TLangManager.Create;
   	FLangMan.SetInnerLanguage('Chinese');
   	OptionMan.AddObserver(FLangMan);
   end;
   result := FLangMan;
end;

procedure RefreshItemText (DlgParent: TxlDialogSuper; arritems: array of word; captionid: word = 0);
var i: integer;
begin
	with DlgParent do
   begin
   	if captionid > 0 then
      	Text := LangMan.GetItem (captionid, Text);
      for i := Low(arritems) to High(arritems) do
         ItemText[arritems[i]] := LangMan.GetItem (arritems[i], ItemText[arritems[i]]);
   end;
end;

//-------------------

procedure TLangManager.FillItems (var lang: widestring; itemlist: TxlStrList);
   procedure f_loadchinese (itemlist: TxlStrList);
   begin
   	with itemlist do
      begin
	      AddByIndex (mc_workspace, '�ļ�(&F)');
            AddByIndex (m_newnote, '�½��ʼ�ҳ(&N)');
//            AddByIndex (m_newsiblingnote, '�½��ʼ�ҳ(&N)');
            AddByIndex (m_newpage, '�½�����ҳ(&T)');
               AddByIndex (m_newcalc, '�½�����ҳ(&C)');
               AddByIndex (m_newmemo, '�½�����ҳ(&M)');
               AddByIndex (m_newdict, '�½��ʵ�ҳ(&D)');
               AddByIndex (m_newlink, '�½�����ҳ(&L)');
               AddByIndex (m_newcontact, '�½�ͨѶҳ(&T)');
            AddByIndex (m_newgroup, '�½���(&G)');

            AddByIndex (m_rename, '������(&A)');
            AddByIndex (m_switchlock, '�����л�(&K)');
            AddByIndex (m_save, '����(&S)');
            AddByIndex (m_deletepage, 'ɾ��(&D)');
            AddByIndex (m_closepage, '�ر�(&C)');

            AddByIndex (m_property, '����(&P)...');
            AddByIndex (m_view, '��ͼ(&V)');

            AddByIndex (m_import, '����(&I)...');
            AddByIndex (m_export, '����(&E)...');
            AddByIndex (m_sendmail, '�����ʼ�(&M)...');

            AddByIndex (m_exit, '�˳�(&X)');

         AddByIndex (mc_edit, '�༭(&E)');
            AddByIndex (m_clear, '���(&L)');
            AddByIndex (m_undo, '����(&U)');
            AddByIndex (m_redo, '����(&R)');
            AddByIndex (m_selectall, 'ȫѡ(&A)');

            AddByIndex (m_cut, '����(&T)');
            AddByIndex (m_copy, '����(&C)');
            AddByIndex (m_paste, 'ճ��(&P)');
            AddByIndex (m_delete, 'ɾ��(&D)');

            AddByIndex (m_newitem, '�½���Ŀ(&N)');
            AddByIndex (m_insertitem, '������Ŀ(&I)');
            AddByIndex (m_edititem, '�༭��Ŀ(&E)');
            AddByIndex (m_deleteitem, 'ɾ����Ŀ(&D)');
            AddByIndex (m_removeitem, '�Ƴ���Ŀ(&R)');

            AddByINdex (m_wordwrap, '�Զ�����(&W)');
            AddByIndex (m_texttools, '���ֹ���(&T)');
               AddByIndex (m_highlight1, '���� 1');
               AddByIndex (m_highlight2, '���� 2');
               AddByIndex (m_highlight3, '���� 3');
               AddByIndex (m_highlight4, '���� 4');
               AddByIndex (m_removehighlight, '�Ƴ�����Ч��');
               AddByIndex (m_ul1, '�����б� 1');
               AddByIndex (m_ul2, '�����б� 2');
               AddByIndex (m_ol, '�����б�');
               AddByIndex (m_removelist, '�Ƴ��б�');
               AddByIndex (m_noemptyline, 'ɾ������');
               AddByIndex (m_oneemptyline, 'ֻ��һ��');
               
            AddByIndex (m_find, '���ң��滻(&F)...');
            AddByIndex (m_subsequentfind, '��������');
               AddByIndex (m_findnext, '������һ��');
               AddByIndex (m_findprevious, '������һ��');
               AddByIndex (m_replace, '�滻��������һ��');
               AddByIndex (m_replace_p, '�滻��������һ��');
               AddByIndex (m_replaceall, 'ȫ���滻');
            AddByINdex (m_highlightmatch, '�������ҽ��');
            
            AddByINdex (m_insertlink, '��������(&L)...');
            AddByIndex (m_insertimage, 'Insert Image(&G)...');
            AddByIndex (m_inserttemplate, '����ģ������(&M)');
            AddByIndex (m_insertcliptext, '�����������(&X)');

         AddByIndex (mc_navigation, '����(&N)');
            AddByIndex (m_prior, '����(&P)');
            AddByIndex (m_next, 'ǰ��(&N)');
            AddByIndex (m_levelup, '��һ��(&U)');

            AddByINdex (m_recentroot, '����ıʼ�(&R)');
            	AddByIndex (m_recentcreate, '�������(&C)');
               AddByIndex (m_recentmodify, '����޸�(&M)');
               AddByIndex (m_recentvisit, '�������(&V)');
            	AddByINdex (m_managerecent, '��������ıʼ�(&M)');
         	AddByIndex (m_favorite, '�ղؼ�(&F)');
            	AddByIndex (m_addfavorite, '�������ղؼ�(&A)');
               AddByIndex (m_removefavorite, '���ղؼ��Ƴ�(&R)');
               AddByINdex (m_managefavorite, '�ղؼй���(&M)');
            AddByIndex (m_search, '����(&S)...');
            AddByINdex (m_tag, '�������(&T)');
            AddByINdex (m_recyclebin, '����վ����(&R)');

         AddByIndex (mc_tools, '����(&T)');
            AddByIndex (m_ShowTree, '��ʾĿ¼��(&T)');
            AddByIndex (m_stayontop, '������ǰ(&S)');
            AddByIndex (m_transparent, '͸��Ч��(&R)');
            AddByIndex (m_specialmode, '�Զ�����(&H)');

            AddByIndex (m_template, '����ģ�����(&P)');
            AddByIndex (m_fastlink, '�������ӹ���(&L)');

            AddByIndex (m_watchclipboard, '���������(&W)');
            AddByIndex (m_clearclipboard, '��ռ�����Ŀ(&C)');
            AddByIndex (m_clipboard, '���������(&M)');

            AddByIndex (m_statistics, 'ͳ����Ϣ(&A)...');
            AddByIndex (m_definetoolbar, '�Զ��幤����(&D)...');
            AddByIndex (m_options, 'ѡ��(&O)...');

         AddByIndex (mc_help, '����(&H)');
            AddByIndex (m_helptopic, '��������(&H)');
            AddByIndex (m_homepage, '��ҳ(&P)');
            AddByIndex (m_forum, '��̳(&F)');
            AddByIndex (m_donate, '����(&D)');
            AddByIndex (m_about, '����(&A)...');

         AddByIndex (ob_program, '��������');
            AddByIndex (ob_edit, '�༭����');
            AddByIndex (ob_notes, '�ʼ�ժ¼');
            AddByIndex (ob_import_export, '���뵼��');
            AddByIndex (ob_behavior, '����ϰ��');
            AddByIndex (ob_login, '��¼����');
            AddByIndex (ob_backup, '�����뱸��');
            AddByIndex (ob_specialmode, '�Զ�����');

         AddByIndex (ob_appearance, '��������');
            AddByIndex (ob_treeview, '������');
            AddByIndex (ob_tabcontrol, '��ǩ��');
            AddByIndex (ob_listview, '�б�����');
            AddByIndex (ob_editor, '�༭��');
            AddByIndex (ob_othercontrols, '����');

         AddByIndex (ob_extfuncs, '��չ����');
            AddByIndex (ob_calcpage, '����ҳ');
            AddByIndex (ob_dictpage, '�ʵ�ҳ');
            AddByIndex (ob_linkpage, '����ҳ');
            AddByIndex (ob_clipboard, '���ؼ�����');
            AddByINdex (ob_template, '����ģ��');

         AddByIndex (m_openfastlink, '��������');
         AddByIndex (m_restore, '��ԭ');
         AddByIndex (m_minimize, '��С��');
         AddByIndex (m_newnoteforeground, '�½��ʼ�');
         AddByIndex (m_autorecord, '�Զ���¼');
         
         AddByIndex (sr_filefilter, '�����ļ���*.*��|*.*|��ִ���ļ�(*.exe)|*.exe|DOC �ļ�(*.doc)|*.doc|XLS �ļ�(*.xls)|*.xls|PPT �ļ�(*.ppt)|*.ppt|PDF �ļ�(*.pdf)|*.pdf|�ı��ļ�(*.txt)|*.txt');
         AddByIndex (sr_selectfile, 'ѡ���ļ�');
         AddByIndex (sr_selectfolder, 'ѡ���ļ���');
         AddByINdex (sr_selectbackupfolder, 'ѡ�񱸷��ļ���');
         AddByIndex (sr_ExeFilter, '��ִ���ļ�(*.exe)|*.exe');
         AddByINdex (sr_selectsoundfile, 'ѡ�������ļ�');
         AddByIndex (sr_soundfilefilter, '�����ļ�(*.wav)|*.wav');

         AddByIndex (sr_free, '����');
         AddByIndex (sr_left, '��');
         AddByINdex (sr_top, '��');
         AddByIndex (sr_right, '��');
         AddByIndex (sr_bottom, '��');

         AddByIndex (sr_NewReminder, '�½�������Ŀ');
         AddByIndex (sr_EditReminder, '�༭������Ŀ');
         AddByINdex (sr_NewLink, '�½�����');
         AddByIndex (sr_EditLink, '�༭����');
         AddByIndex (sr_NewTemplate, '�½�����ģ��');
         AddByIndex (sr_EditTemplate, '�༭����ģ��');
         AddByINdex (sr_EditContact, '�༭��ϵ��');
         AddByINdex (sr_NewContact, '�½���ϵ��');

         AddByINdex (sr_MemoAction, '��ʱ����');
         AddByIndex (sr_MemoAction + 1, 'ִ������');
         AddByIndex (sr_MemoAction + 2, '�޲���');

         AddByINdex (sr_Time, 'ʱ��');
         AddByIndex (sr_Action, '����');
         AddByIndex (sr_Description, '����');
         AddByIndex (sr_UseSound, '��ʾ��');
         AddByIndex (sr_SoundFile, '�����ļ�');

         AddByIndex (sr_today, '����');
         AddByIndex (sr_daily, 'ÿ��');
         AddByIndex (sr_weekly, 'ÿ��');
         AddByIndex (sr_monthly, 'ÿ��');
         AddByIndex (sr_yearly, 'ÿ��');
         AddByIndex (sr_timespan, '�ճ�');
         AddByIndex (sr_notime, '��ʱ��');

         AddByIndex (sr_LinkTypes, '�����ļ�');
         AddByIndex (sr_LinkTypes + 1, '�ļ���');
         AddByIndex (sr_LinkTypes + 2, '��ַ');
         AddByIndex (sr_LinkTypes + 3, '�ռ���ַ');
         AddByIndex (sr_LinkTypes + 4, '�ڵ�');
         AddByIndex (sr_LinkTypes + 5, '����');
         AddByIndex (sr_LinkTypes + 6, '������');

         AddByIndex (sr_LinkType, '���');
         AddByIndex (sr_Link, '����');
         AddByIndex (sr_Hotkey, '�ȼ�');
         AddByIndex (sr_Abbrev, '��д');

         AddByIndex (sr_boy, '��');
         AddByIndex (sr_girl, 'Ů');

         AddByIndex (sr_Name, '����');
         AddByIndex (sr_Sex, '�Ա�');
         AddByIndex (sr_Mobile, '�ֻ�');
         AddByIndex (sr_Email, 'Email');
         AddByIndex (sr_IM1, 'QQ');
         AddByIndex (sr_IM2, 'MSN');
         AddByIndex (sr_Company, '��λ');
         AddByIndex (sr_Department, '���ţ�ְ��');
         AddByIndex (sr_Address, '��ַ');
         AddByIndex (sr_Zipcode, '�ʱ�');
         AddByIndex (sr_Tel, '�绰');
         AddByIndex (sr_Fax, '����');
         AddByIndex (sr_Others, '����');

         AddByIndex (sr_NewClipItem, '�½�������Ŀ');
         AddByIndex (sr_EditClipItem, '�༭������Ŀ');

         AddByIndex (IDOK, 'ȷ    ��');
         AddByIndex (IDCancel, 'ȡ    ��');
         AddByIndex (sr_prompt, 'ע��!');
         AddByINdex (sr_info, '��ʾ!');

         AddByIndex (sr_optionalitems, '��ѡ��Ŀ');
         AddByIndex (sr_SelectImportFile, 'ѡ�����ļ�');
         AddByIndex (sr_ImportFilter, '�ı��ļ���*.txt��|*.txt|minipad2 �����ļ�(*.mep)|*.mep|�����ļ���*.*��|*.*');
         AddByIndex (sr_NameExportFile, '�趨�����ļ���');
         AddByIndex (sr_ExportFilter1, '�ı��ļ���*.txt��|*.txt|Markdown (*.md)|*.md|�����ļ���*.*��|*.*');
         AddByIndex (sr_ExportFilter2, '�ı��ļ���*.txt��|*.txt|Markdown (*.md)|*.md|minipad2 �����ļ�(*.mep)|*.mep|�����ļ���*.*��|*.*');
         AddByIndex (sr_ExportFilter3, 'minipad2 �����ļ�(*.mep)|*.mep|�ı��ļ���*.txt��|*.txt|Markdown (*.md)|*.md|�����ļ���*.*��|*.*');
         AddByIndex (sr_ListCopied, '�б������Ѹ��Ƶ������壡');
         AddByIndex (sr_BrowseMailClient, 'ѡ���ʼ��ͻ��˿�ִ���ļ�');
         AddByIndex (sr_TemplateCaptured, '��ѡ�����ѱ����ӵ� minipad2 ������ģ���б���');
         AddByIndex (sr_TemplateExists, 'ģ���б�����ͬ���ݵ���Ŀ���� %0 ��Ѵ��ڣ�');
         AddByIndex (sr_TableOfContents, 'Ŀ¼');
         AddByIndex (sr_codetransfer, '�ʵ��ַ�����ת����, ��ȴ�...');
         AddByIndex (sr_SelectIcon, 'ѡ��ͼ���ļ�');
         AddByIndex (sr_IconFilter, 'ͼ���ļ���*.ico��|*.ico|�����ļ���*.*��|*.*');

         AddByIndex (sr_RemoveFastLinkItemsPrompt, '�Ƿ���ѡ��Ŀ�ӿ��������б����Ƴ�?');
         AddByIndex (sr_DeleteItemsPrompt, '�Ƿ�ɾ����ѡ��Ŀ?');
         AddByIndex (sr_RemoveItemsPrompt, '�Ƿ��Ƴ���ѡ��Ŀ?');
         AddByIndex (sr_DeletePagesPrompt, '�Ƿ�ɾ����ѡ��ǩҳ?');
         AddByIndex (sr_deletegroupprompt, '��ǰ������ӽڵ㡣���Ҫȫ��ɾ����');
         AddByINdex (sr_clearprompt, '���Ҫ��յ�ǰ��ǩҳ��������');
         AddByINdex (sr_deleteprompt, '���Ҫɾ����ǰҳ��');
         AddByIndex (sr_clearclipboardprompt, '�Ƿ�������м�������Ŀ��');
         AddByIndex (sr_UnsupportedOperation, '������֧�֣�');
         AddByIndex (sr_NewNoteCreated, '�Ѵ����±ʼǣ�����Ϊ��');
         AddByIndex (sr_SnapTextSuccess, '��ץȡ�������֣�');
         AddByIndex (sr_newnotebgandsnaptextsuccess, '�Ѵ����±ʼǲ�ץȡ�������֣�');
         AddByIndex (sr_DataSaved, '�����ѱ���.');
         AddByIndex (sr_SaveSnapText, '���沶׽����');
         AddByIndex (sr_SnapTextSavedToFile, '���������ѱ��浽�ļ�');
			AddByIndex (sr_ExportedToFolder, '��ǰ�ڵ㣨�����ӽڵ㣩�ѵ������ļ��У�');
         AddByIndex (sr_PageExportedToFile, '��ǰҳ�����ѵ������ļ���');
         AddByIndex (sr_PageExportedToClipboard, '��ǰҳ�����ѵ�����������');
         AddByIndex (sr_GroupExportedToFile, '��ǰ�ڵ㣨�����ӽڵ㣩�����ѵ������ļ���');
         AddByINdex (sr_mepversionnotmatch, 'mep �ļ��汾��ƥ�䣡');
         AddByINdex (sr_invalidnodelink, '�ڵ�������Ч��');
         AddByIndex (sr_importingPrompt, '�ļ������У���ס ESC ����ֹ...');
         AddByIndex (sr_userabortimport, '�û���ֹ����');
         AddByIndex (sr_exportingprompt, 'ҳ�浼���У���ס ESC ����ֹ...');
         AddByIndex (sr_userabortexport, '�û���ֹ����');
         AddByIndex (sr_deletingprompt, '��Ŀɾ���У���ס ESC ����ֹ...');
         AddByIndex (sr_userabortdelete, '�û���ֹɾ��');

         AddByIndex (sr_TemplatePage, '����ģ��');
         AddByIndex (sr_FastLink, '��������');
         AddByIndex (sr_Clipboard, '��������');

         AddByIndex (sr_RecentRoot, '����ıʼ�');
            AddByIndex (sr_RecentCreate, '�������');
            AddByIndex (sr_RecentModify, '����޸�');
            AddByIndex (sr_RecentVisit, '�������');
         AddByINdex (sr_FavoritePage, '�ղؼ�');
         AddByIndex (sr_SearchPage, '����');
         AddByIndex (sr_TagRoot, '����');
         AddByIndex (sr_GroupRoot, 'ȫ��');
         AddByIndex (sr_RecycleBin, '����վ');

         AddByINdex (sr_Normal, '����');
         AddByIndex (sr_Locked, '����');
         AddByIndex (sr_Protected, '׷��');
         AddByIndex (sr_ReadOnly, 'ֻ��');

         AddByIndex (sr_saves, '�α���');
         AddByIndex (sr_minutes, '����');
         AddByIndex (sr_hours, 'Сʱ');
         AddByIndex (sr_days, '��');
         
         AddByIndex (rb_icon, '��ͼ��');
         AddByIndex (rb_smallicon, 'Сͼ��');
         AddByIndex (rb_list, '�б�');
         AddByINdex (rb_report, '��ϸ��Ϣ');
         AddByIndex (rb_blog, 'ժҪ');

         AddByIndex (Property_General, '����');
         AddByINdex (Property_Edit, '����');
         AddByIndex (Property_List, '�б�');

         AddByIndex (sr_Title, '����');
         AddByIndex (sr_CreateTime, '����ʱ��');
         AddByIndex (sr_ModifyTime, '�޸�ʱ��');
         AddByIndex (sr_VisitTime, '����ʱ��');
         AddByIndex (sr_ExportFile, '�ļ�');
         AddByIndex (sr_ExternalSave, '�ⲿ�洢');
         AddByIndex (sr_Abstract, '����');
         AddByIndex (sr_SearchResult, '����ժҪ');
         AddByIndex (sr_Remark, '��ע');
         AddByIndex (sr_Text, '����');
         AddByIndex (sr_NodePath, '�ڵ�·��');
         
         AddByINdex (sr_GroupPage, '��');
         AddByINdex (sr_GroupPage + Ord(ptNote), '�ʼ�ҳ');
         AddByIndex (sr_GroupPage + Ord(ptCalc), '����ҳ');
         AddByIndex (sr_GroupPage + Ord(ptMemo), '����ҳ');
         AddByIndex (sr_GroupPage + Ord(ptDict), '�ʵ�ҳ');
         AddByIndex (sr_GroupPage + Ord(ptLink), '����ҳ');
         AddByIndex (sr_GroupPage + Ord(ptContact), 'ͨѶҳ');
         AddByIndex (sr_GroupPage + Ord(ptMemoItem), '������');
         AddByIndex (sr_GroupPage + Ord(ptLinkItem), '������');
         AddByIndex (sr_GroupPage + Ord(ptContactItem), '��ϵ��');
         AddByIndex (sr_GroupPage + Ord(ptTemplateItem), '����ģ��');
         AddByIndex (sr_GroupPage + Ord(ptClipItem), '������Ŀ');

         AddByIndex (sr_Include, '����');
         AddByINdex (sr_NotInclude, '������');

         AddByIndex (tp_CurrentPage, '��ǰҳ');
         AddByIndex (tp_Database, '���ݿ�');
      end;
   end;
var s_file: widestring;
begin
	itemlist.clear;
   s_file := LangDir + lang + '.lng';
	if IsSameStr (lang, 'Chinese') then
   	f_loadchinese (itemlist)
   else if pathfileexists (s_file) then
   begin
   	itemlist.IndexDeli := '=';
      itemlist.loadfromfile (s_file);
   end;
end;

procedure TLangManager.OptionChanged ();
begin
   SetLanguage (OptionMan.options.Language);
end;

initialization

finalization
	FreeAndNil (FLangMan);

end.






