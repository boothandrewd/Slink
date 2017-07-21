import { connect } from 'react-redux';
import ChatWindowIndex from './chat_window_index';

const mapStateToProps = ({ channels, windows }) => ({
  channels: windows.map(idx => channels[idx]),
});

export default connect(
  mapStateToProps
)(ChatWindowIndex);
