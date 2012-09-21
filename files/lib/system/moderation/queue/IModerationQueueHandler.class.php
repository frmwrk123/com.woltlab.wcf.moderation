<?php
namespace wcf\system\moderation\queue;

/**
 * Default interface for moderation queue handlers.
 * 
 * @author	Alexander Ebert
 * @copyright	2001-2012 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.moderation
 * @subpackage	system.moderation.queue
 * @category 	Community Framework
 */
interface IModerationQueueHandler {
	/**
	 * Creates queue assignments for matching object ids.
	 * 
	 * @param	array<wcf\data\moderation\queue\ModerationQueue>	$queues
	 */
	public function assignQueues(array $queues);
	
	/**
	 * Returns the container id for current object id, may return 0.
	 * 
	 * @param	integer		$objectID
	 * @return	integer
	 */
	public function getContainerID($objectID);
	
	/**
	 * Returns true, if given object id is valid.
	 * 
	 * @param	integer		$objectID
	 * @return	boolean
	 */
	public function isValid($objectID);
	
	/**
	 * Populates object properties for viewing.
	 * 
	 * @param	array<wcf\data\moderation\queue\ViewableModerationQueue>	$objects
	 */
	public function populate(array $objects);
}
