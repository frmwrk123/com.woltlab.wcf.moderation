{include file='documentHeader'}

<head>
	<title>{lang}wcf.moderation.activation{/lang} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<script type="text/javascript" src="{@$__wcf->getPath()}js/WCF.Moderation.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function() {
			new WCF.Moderation.Activation.Management({@$queue->queueID}, '{link controller='ModerationList'}{/link}');
			
			WCF.Language.addObject({
				'wcf.moderation.activation.enableContent.confirmMessage': '{lang}wcf.moderation.activation.enableContent.confirmMessage{/lang}',
				'wcf.moderation.activation.removeContent.confirmMessage': '{lang}wcf.moderation.activation.removeContent.confirmMessage{/lang}'
			});
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}">

{include file='header' sidebarOrientation='left'}

<header class="boxHeadline">
	<hgroup>
		<h1>{lang}wcf.moderation.activation{/lang}</h1>
	</hgroup>
</header>

{include file='userNotice'}

<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link controller='ModerationList'}{/link}" title="{lang}wcf.moderation.moderation{/lang}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.moderation.moderation{/lang}</span></a></li>
			{event name='largeButtonsTop'}
		</ul>
	</nav>
</div>

<form method="post" action="{link controller='ModerationActivation' id=$queue->queueID}{/link}" class="container containerPadding marginTop">
	<fieldset>
		<legend>{lang}wcf.moderation.activation.details{/lang}</legend>
		
		<dl>
			<dt>{lang}wcf.global.objectID{/lang}</dt>
			<dd>{#$queue->queueID}</dd>
		</dl>
		{if $queue->lastChangeTime}
			<dl>
				<dt>{lang}wcf.moderation.lastChangeTime{/lang}</dt>
				<dd>{@$queue->lastChangeTime|time}</dd>
			</dl>
		{/if}
		<dl>
			<dt>{lang}wcf.moderation.assignedUser{/lang}</dt>
			<dd>
				<ul>
					{if $assignedUserID && ($assignedUserID != $__wcf->getUser()->userID)}
						<li><label><input type="radio" name="assignedUserID" value="{@$assignedUserID}" checked="checked" /> {$queue->assignedUsername}</label></li>
					{/if}
					<li><label><input type="radio" name="assignedUserID" value="{@$__wcf->getUser()->userID}"{if $assignedUserID == $__wcf->getUser()->userID} checked="checked"{/if} /> {$__wcf->getUser()->username}</label></li>
					<li><label><input type="radio" name="assignedUserID" value="0"{if !$assignedUserID} checked="checked"{/if} /> {lang}wcf.moderation.assignedUser.nobody{/lang}</label></li>
				</ul>
			</dd>
		</dl>
		{if $queue->assignedUser}
			<dl>
				
				<dd><a href="{link controller='User' id=$assignedUserID}{/link}" class="userLink" data-user-id="{@$assignedUserID}">{$queue->assignedUsername}</a></dd>
			</dl>
		{/if}
		<dl>
			<dt><label for="comment">{lang}wcf.moderation.comment{/lang}</label></dt>
			<dd><textarea id="comment" name="comment" rows="4" cols="40">{$comment}</textarea></dd>
		</dl>
		
		<div class="formSubmit">
			<input type="submit" value="{lang}wcf.global.button.submit{/lang}" />
		</div>
	</fieldset>
</form>

<header class="boxHeadline">
	<hgroup>
		<h1>{lang}wcf.moderation.activation.content{/lang}</h1>
	</hgroup>
</header>

<div class="marginTop">
	{@$disabledContent}
</div>

<div class="contentNavigation">
	<nav>
		<ul>
			<li class="jsOnly"><button id="enableContent">{lang}wcf.moderation.activation.enableContent{/lang}</button></li>
			<li class="jsOnly"><button id="removeContent">{lang}wcf.moderation.activation.removeContent{/lang}</button></li>
			<li><a href="{link controller='ModerationList'}{/link}" title="{lang}wcf.moderation.moderation{/lang}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.moderation.moderation{/lang}</span></a></li>
			{event name='largeButtonsTop'}
		</ul>
	</nav>
</div>

{include file='footer'}

</body>
</html>