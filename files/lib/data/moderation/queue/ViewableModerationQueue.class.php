<?php
namespace wcf\data\moderation\queue;
use wcf\data\DatabaseObjectDecorator;
use wcf\data\IUserContent;
use wcf\system\moderation\queue\ModerationQueueManager;

/**
 * Represents a viewable moderation queue entry.
 * 
 * @author	Alexander Ebert
 * @copyright	2001-2012 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.moderation
 * @subpackage	data.moderation.queue
 * @category 	Community Framework
 */
class ViewableModerationQueue extends DatabaseObjectDecorator {
	/**
	 * @see	wcf\data\DatabaseObject::$baseClass
	 */
	protected static $baseClass = 'wcf\data\moderation\queue\ModerationQueue';
	
	/**
	 * affected object
	 * @var	wcf\data\IUserContent
	 */
	protected $affectedObject = null;
	
	/**
	 * Sets link for viewing/editing.
	 * 
	 * @param	wcf\data\IUserContent		$object
	 */
	public function setAffectedObject(IUserContent $object) {
		$this->affectedObject = $object;
	}
	
	/**
	 * Returns the link for viewing/editing this object.
	 * 
	 * @return	string
	 */
	public function getLink() {
		return ModerationQueueManager::getInstance()->getLink($this->objectTypeID, $this->queueID);
	}
	
	/**
	 * Returns the title for this entry.
	 * 
	 * @return	string
	 */
	public function getTitle() {
		return ($this->affectedObject === null ? '' : $this->affectedObject->getTitle());
	}
	
	/**
	 * Returns affected object.
	 * 
	 * @return	wcf\data\IUserContent
	 */
	public function getAffectedObject() {
		return $this->affectedObject;
	}
	
	/**
	 * @see	wcf\data\moderation\queue\ViewableModerationQueue::getTitle()
	 */
	public function __toString() {
		return $this->getTitle();
	}
	
	/**
	 * Returns a viewable moderation queue entry.
	 * 
	 * @param	integer		$queueID
	 * @return	wcf\data\moderation\queue\ViewableModerationQueue
	 */
	public static function getViewableModerationQueue($queueID) {
		$queueList = new ViewableModerationQueueList();
		$queueList->getConditionBuilder()->add("moderation_queue.queueID = ?", array($queueID));
		$queueList->sqlLimit = 1;
		$queueList->readObjects();
		$queues = $queueList->getObjects();
		
		return (isset($queues[$queueID]) ? $queues[$queueID] : null);
	}
}