{if $__wcf->user->userID && $__wcf->session->getPermission('mod.general.canUseModeration')}	
	{* static link to moderation *}
	<li>
		<a class="jsTooltip" href="{link controller='ModerationList'}{/link}" title="{lang}wcf.moderation.moderation{/lang}">
			<img src="{icon size='M'}warningInverse{/icon}" alt="" class="icon24" />
			<span class="invisible">{lang}wcf.moderation.moderation{/lang}</span>
			<span class="badge badgeInverse">{#$__wcf->getModerationQueueManager()->getOutstandingModerationCount()}</span>
		</a>
	</li>
{/if}