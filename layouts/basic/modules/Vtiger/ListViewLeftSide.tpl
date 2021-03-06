{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	<div>
		<input type="checkbox" value="{$LISTVIEW_ENTRY->getId()}" class="listViewEntriesCheckBox" title="{\App\Language::translate('LBL_SELECT_SINGLE_ROW')}" />
	</div>
	{assign var=LINKS value=$LISTVIEW_ENTRY->getRecordListViewLinksLeftSide()}
	{if count($LINKS) > 0}
		{assign var=ONLY_ONE value=count($LINKS) eq 1}
		<div class="actions">
			<div class="{if !$ONLY_ONE}actionImages d-none bg-light{/if}">
				{foreach from=$LINKS item=LINK}
					{include file=\App\Layout::getTemplatePath('ButtonLink.tpl', $MODULE) BUTTON_VIEW='listViewBasic'}
				{/foreach}
			</div>
			{if !$ONLY_ONE}
				<button type="button" class="btn btn-sm btn-light toolsAction">
					<span class="fas fa-wrench"></span>
				</button>
			{/if}
		</div>
	{/if}
	<div>
		{if in_array($MODULE, AppConfig::module('ModTracker', 'SHOW_TIMELINE_IN_LISTVIEW')) && $MODULE_MODEL->isPermitted('TimeLineList')}
			<a  data-url="{$LISTVIEW_ENTRY->getTimeLineUrl()}" class="badgeIcon fa-fw timeLineIconList d-none"></a>
		{/if}
		{if AppConfig::module('ModTracker', 'UNREVIEWED_COUNT') && $MODULE_MODEL->isPermitted('ReviewingUpdates') && $MODULE_MODEL->isTrackingEnabled() && $LISTVIEW_ENTRY->isViewable()}
			<a href="{$LISTVIEW_ENTRY->getUpdatesUrl()}" class="unreviewed">
				<span class="badge badge-danger u-badge all" title="{\App\Language::translate('LBL_NUMBER_UNREAD_CHANGES', 'ModTracker')}"></span>
				<span class="badge badge-primary u-badge mail" title="{\App\Language::translate('LBL_NUMBER_UNREAD_MAILS', 'ModTracker')}"></span>
			</a>
		{/if}
	</div>
{/strip}
